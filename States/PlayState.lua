PlayState = Class{__includes = BaseState}

local checker=0
local bounce=1
local player_death=0
local check=0
local player_lives=3
local end_world=0
persisting=0
function PlayState:init()
  self.ww = 800
  self.wh = 800
  self.flip="shoot"
  self.pause=false
  game_background_music=love.audio.newSource("GameSounds/horror_test_2.wav","stream")
  game_background_music:setLooping(true)
  game_background_music:play()
end

function PlayState:enter()
  world:setCallbacks(beginContact,endContact,preSolve,postSolve)
  world_bullet:setCallbacks(beginContact,endContact,preSolve,postSolve)

  table.insert(player_life,player(player_attributes[1],player_attributes[2],player_attributes[3]))
end
--------------------------------------------------------------------------------Physics collision
function beginContact(a,b,coll)
  love.audio.stop(ball_wall_sound)
  bounce=bounce+1
  d_check=a:getUserData()
  d2_check=b:getUserData()
  if(d_check=="bullet")then
    a:setUserData"delete_bullet"
  elseif(d2_check=="bullet")then
    b:setUserData"delete_bullet"
  end
  ------------------------------------------------------------------------------to check bullet and wall collision
  if(d_check=="invisible_enemy" and d2_check=="bullet")then--- and d2_check=="bullet"))then
  checker=1
    a:setUserData("visible_enemy")
    b:setUserData("delete_bullet")
    love.audio.play(ball_wall_sound)
  elseif((d2_check=="invisible_enemy" and d_check=="bullet"))then
    b:setUserData("visible_enemy")
    a:setUserData("delete_bullet")
    love.audio.play(ball_wall_sound)
  end
  ------------------------------------------------------------------------------to check collision with the blocks+

  if((d_check=="player" and (d2_check=="visible_enemy" or d2_check=="invisible_enemy")) or (d2_check=="player" and (d_check=="visible_enemy" or d_check=="invisible_enemy")))then
    a:setUserData(a:getUserData()=="invisible_enemy" and "visible_enemy" or a:getUserData())
    b:setUserData(b:getUserData()=="invisible_enemy" and "visible_enemy" or b:getUserData())
    player_death=1
  end
  ------------------------------------------------------------------------------to check player goal collision
  if((d_check=="goal" and d2_check=="player") or (d_check=="player" and d2_check=="goal"))then
    end_world=1
  end
  ------------------------------------------------------------------------------to check enemy player collision
  if((d2_check=="monster" and d_check=="player") or (d_check=="monster" and d2_check=="player"))then
    love.audio.play(enemy_hit_sound)
    player_death=1
  end
  ------------------------------------------------------------------------------
  x,y=coll:getNormal()
end
function endContact(a,b,coll)
  persisting=0
end
function preSolve(a,b,coll)
  persisting =persisting+1;
end
function postSolve(a,b,coll,normalimpulse,tangentimpulse)
end
--------------------------------------------------------------------------------
function PlayState:update(dt)
  if(self.pause==false)then
      world_bullet:update(dt)
      world:update(dt)
      --------------------------------------------------------------------------
    for k,v in pairs(player_life)do
      v:update(dt)
    end
    ----------------------------------------------------------------------------bullet updation
    for k,v in pairs(all_bullets)do
      v:update(dt)
      if(v.fixture:getUserData()=="delete_bullet" or bounce>#collision_objects+6 or v.timer>v.max_time_limit)then
        v.body:destroy()
        table.remove(all_bullets,k)
        bounce=0
      end
    end
    ----------------------------------------------------------------------------player death detection
    if(player_death==1)then
      player_lives=player_lives-1
      player_life[1].body:destroy()
      player_life={}
      for k,v in pairs(all_enemies)do
        v.body:destroy()
      end
      all_enemies={}
      for k,v in pairs(enemy_table)do
        table.insert(all_enemies,enemy(v.x,v.y,v.radius,v.detection_radius))
      end

      if(player_lives>0)then
        table.insert(player_life,player(player_attributes[1],player_attributes[2],player_attributes[3]))
      else
        exit()
      end
      player_death=0
    end
    ----------------------------------------------------------------------------world ender function
    if(end_world==1)then
      exit()
      end_world=0
    end
  end
  ------------------------------------------------------------------------------Monster movement update
  for k,v in pairs(all_enemies)do
    v:update(dt)
  end
end

function PlayState:render()
  love.graphics.draw(play_background_image,-10,0)
  ------------------------------------------------------------------------------Drawing the player
  for k,v in pairs(player_life)do
    v:draw()
  end

  ------------------------------------------------------------------------------The objects from the world "World"
  for k,v in pairs(all_obj)do
    love.graphics.setColor(1,0,0,(v.fixture:getUserData()=="visible_enemy" and 1 or 0))
    --love.graphics.rectangle("fill",v.x,v.y,v.width,v.height)
    aah=love.graphics.newQuad(0,WINDOW_WIDTH-v.height-25,v.width,v.height,play_wall_image:getDimensions())
    love.graphics.draw(play_wall_image,aah,v.x,v.y)
  end
  ------------------------------------------------------------------------------The objects from the second world
  for k,v in pairs(all_obj_world_2)do
    love.graphics.setColor(1,0,0,(v.fixture:getUserData()=="visible_enemy" and 1 or 0))
    love.graphics.rectangle("fill",v.x,v.y,v.width,v.height)
    aah=love.graphics.newQuad(0,WINDOW_WIDTH-v.height-25,v.width,v.height,play_wall_image:getDimensions())
    love.graphics.draw(play_wall_image,aah,v.x,v.y)
  end
  ------------------------------------------------------------------------------lives_image

  ------------------------------------------------------------------------------drawing the bullets
  for k,v in pairs(all_bullets)do
    v:draw()
  end
  ------------------------------------------------------------------------------Printing the goal
  for k,v in pairs(all_goals)do
    love.graphics.setColor(1,1,1)
    --love.graphics.rectangle("fill",v.x,v.y,v.width,v.height)
    love.graphics.draw(goal_image,v.x,v.y)
  end
  ------------------------------------------------------------------------------printing GUI miscellaneous
    love.graphics.draw(lives_image,10,10)
    love.graphics.print(player_lives,80,30)
    love.graphics.setColor(1,0,0)
    love.graphics.draw(paintball,120,40,0,2,2)
    love.graphics.setColor(1,1,1)
    love.graphics.print(bullets_total,150,30)
  ------------------------------------------------------------------------------Printing the monsters
  for k,v in pairs(all_enemies)do
    love.graphics.setColor(1,1,1)
    v:draw()
  end
  ------------------------------------------------------------------------------pause menu
  if(self.pause==true)then
    love.graphics.setColor(1,1,1,0.5)
    love.graphics.setFont(love.graphics.newFont(30))
    love.graphics.setLineWidth(4)
    love.graphics.rectangle("fill",WINDOW_WIDTH/2-WINDOW_HEIGHT/4,WINDOW_HEIGHT/2-WINDOW_HEIGHT/4,WINDOW_WIDTH/2,WINDOW_HEIGHT/2)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",WINDOW_WIDTH/2-100, WINDOW_HEIGHT/2-110,200,50,20)
    love.graphics.setColor(1,0,0)
    love.graphics.printf("Main Menu",WINDOW_WIDTH/2-80, WINDOW_HEIGHT/2-100,self.ww)
    ----------------------------------------------------------------------------level selection screen
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",WINDOW_WIDTH/2-100, WINDOW_HEIGHT/2-30,200,50,20)
    love.graphics.setColor(1,0,0)
    love.graphics.printf("Level Select",WINDOW_WIDTH/2-90, WINDOW_HEIGHT/2-20,self.ww)
--------------------------------------------------------------------------------resume selection
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",WINDOW_WIDTH/2-100, WINDOW_HEIGHT/2+50,200,50,20)
    love.graphics.setColor(1,0,0)
    love.graphics.printf("Resume",WINDOW_WIDTH/2-60, WINDOW_HEIGHT/2+60,self.ww)
    --love.graphics.setColor()
    ----------------------------------------------------------------------------
  end
end
--------------------------------------------------------------------------------
function PlayState:check_key_released(key)
  for k,v in pairs(player_life)do
    v:check_key_released(key)
  end
end
--------------------------------------------------------------------------------

function PlayState:checking(x,y)
  ------------------------------------------------------------------------------For bullet firing
  if(#all_bullets==0 and bullets_total>0 and self.pause==false)then
    check=1
    for k,v in pairs(player_life)do
      table.insert(all_bullets,bullets(v.body:getX(),v.body:getY(),math.atan2(-(v.body:getY()-y),-(v.body:getX()-x))))
      bullets_total=bullets_total-1
    end
  end
  ------------------------------------------------------------------------------Pause screen selection
  if(self.pause==true)then
    if(x<WINDOW_WIDTH/2-100+200 and x>WINDOW_WIDTH/2-100 and y<WINDOW_HEIGHT/2-110+50 and y>WINDOW_HEIGHT/2-110)then
      exit()
      gStateMachine:change("title")
    elseif(x>WINDOW_WIDTH/2-100 and x<WINDOW_WIDTH/2-10+200 and y>WINDOW_HEIGHT/2-30 and y<WINDOW_HEIGHT/2-30+50)then
      exit()
      gStateMachine:change("level select")
      love.graphics.rectangle("line",WINDOW_WIDTH/2-100, WINDOW_HEIGHT/2+50,200,50)
    elseif(x>WINDOW_WIDTH/2-100 and x<WINDOW_WIDTH/2-100+200 and y>WINDOW_HEIGHT/2+50 and y<WINDOW_HEIGHT/2+50+50)then
      self.pause=false
    end
  end
end

function PlayState:check_key_pressed(key)
  if(key=="escape")then
    self.pause=self.pause==false and true or false
  end
end

--------------------------------------------------------------------------------A function to delete all the bodies and the table on level exit thus preserving space
function exit()
  for k,v in pairs(all_obj)do
    v.body:destroy()
  end
  for k,v in pairs(all_goals)do
    v.body:destroy()
  end
  for k,v in pairs(all_enemies)do
    v.body:destroy()
  end
  all_enemies={}
  collision_objects={}
  player_attributes={}
  goal_attributes={}
  bullets_total={}
  all_obj={}
  player_life={}
  all_bullets={}
  all_obj_world_2={}
  all_goals={}
  player_lives=3
  checker=0
  bounce=1
  check=0
  player_lives=3
  end_world=0
  game_background_music:stop()
  if(player_death==0)then
      player_death=0
    gStateMachine:change('victory')
  else
      player_death=0
    gStateMachine:change('loss')
  end
end
