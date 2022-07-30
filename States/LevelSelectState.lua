LevelSelectState = Class{__includes = BaseState}

current_level=1     ------------------------sets default current level to level1

function LevelSelectState:init()
  self.ww = 800
  self.wh = 800
  self.mouse_x=0
  self.level=1
  self.mouse_y=0
  self.Many_levels_coordinates={}     --------------empty table for coordinates of circles to be rendered
  self.counter=1
  for i=1,2 do
    table.insert(self.Many_levels_coordinates,{x=100,y=200*i,r=30,collide=false,l=self.counter})
    self.counter=self.counter+1
    table.insert(self.Many_levels_coordinates,{x=250,y=200*i,r=30,collide=false,l=self.counter})
    self.counter=self.counter+1
    table.insert(self.Many_levels_coordinates,{x=400,y=200*i,r=30,collide=false,l=self.counter})
    self.counter=self.counter+1
    table.insert(self.Many_levels_coordinates,{x=550,y=200*i,r=30,collide=false,l=self.counter})
    self.counter=self.counter+1
    table.insert(self.Many_levels_coordinates,{x=700,y=200*i,r=30,collide=false,l=self.counter})
    self.counter=self.counter+1
  end

  self.Menu_selection={}
  --------------------------------------create a array with only the

end
------------------------------detection of mouse click----------------------
function LevelSelectState:update()
  self.mouse_x,self.mouse_y=push:toGame(love.mouse.getX(),love.mouse.getY())
for keys,values in pairs(self.Many_levels_coordinates) do
    if self.mouse_x~=nil and self.mouse_y~=nil then
      if Circle_coll(values,self.mouse_x,self.mouse_y) < values.r then
         values.collide=true
      else
        values.collide=false
      end
    end
  end
end
-------------------------------------------------------------------------------
----------------------------------------------checking which level is selected-------------
function LevelSelectState:checking(x,y)
  for keys,values in pairs(self.Many_levels_coordinates) do
  --if x~=nil and y~=nil then
    if Circle_coll(values,x,y) < values.r then
      if(values.l<=#level_obj)then
         self.level=keys
         current_level=values.l
         Level_initializer(level_obj[values.l]())
         gStateMachine:change('play')
       end
    end
--  end
end
if(x>20 and x<20+60 and y>10 and y<10+60)then
  gStateMachine:change('title')
end
end

function Circle_coll(values,x,y)
  return math.sqrt((values.x-x)^2 + (values.y-y)^2)
end

function LevelSelectState:render()
  love.graphics.setNewFont(50)
  love.graphics.printf("Level Selection", 0,0,self.ww,'center')
  love.graphics.setNewFont(30)
  ----------------------------------------------renders circles with numbers------------------
  for keys,values in pairs(self.Many_levels_coordinates) do
    if values.collide == true then
      love.graphics.setColor(0,1,0)
      love.graphics.circle('line',values.x,values.y,values.r)
      love.graphics.print(keys,values.x-10,values.y-20)
    else
      love.graphics.setColor(1,1,1)
      love.graphics.circle('line',values.x,values.y,values.r)
      love.graphics.print(keys,values.x-10,values.y-20)
    end
  end
  ------------------------------------------------------------------------------Main menu button
  love.graphics.setColor(1,1,1)
  love.graphics.draw(love.graphics.newImage("drawable_assets/home_button.png"),20,10)

end
