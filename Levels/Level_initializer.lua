Level_initializer =Class{}

--------------------------------------------------------------------------------necessary global variables
enemy_table=nil
collision_objects={}
player_attributes={}
goal_attributes={}
bullets_total={}
all_obj={}
player_life={}
all_bullets={}
all_obj_world_2={}
all_goals={}
all_enemies={}
--------------------------------------------------------------------------------

function Level_initializer:init(object)
  world=love.physics.newWorld(0,0,sleep)
  world_bullet=love.physics.newWorld(0,0,sleep)
  collision_objects=object.collidables
  player_attributes=object.p_attributes
  goal_attributes=object.goal
  bullets_total=object.bullet_count
  enemy_table=object.enemy_attribute
  for k,v in pairs(collision_objects)do
    table.insert(all_obj,obj_creation(v.x,v.y,v.width,v.height,world))
  end
  -- goal_attributes.body=love.physics.newBody(world_bullet,goal_attributes.x,goal_attributes.y,"static")
  -- goal_attributes.shape=love.physics.newRectangleShape(goal_attributes.width,goal_attributes.height)
  -- goal_attributes.fixture=love.physics.newFixture(goal_attributes.body,goal_attributes.shape)
  -- goal_attributes.fixture:setUserData("goal")
  for k,v in pairs(collision_objects)do
    table.insert(all_obj_world_2,obj_creation(v.x,v.y,v.width,v.height,world_bullet))
  end
  for k,v in pairs(goal_attributes)do
    table.insert(all_goals,goal_create(v.x,v.y,v.width,v.height))
  end
  for k,v in pairs(enemy_table)do
    table.insert(all_enemies,enemy(v.x,v.y,v.radius,v.detection_radius))
  end
end

function goal_create(x,y,w,h)
  local goal={}
  goal.x=x
  goal.y=y
  goal.width=w
  goal.height=h
  goal.body=love.physics.newBody(world_bullet,goal.x+goal.width/2,goal.y+goal.height/2,"static")
  goal.shape=love.physics.newRectangleShape(goal.width,goal.height)
  goal.fixture=love.physics.newFixture(goal.body,goal.shape,1)
  goal.fixture:setUserData("goal")
  return goal
end



function obj_creation(x,y,w,h,world_selection)
local obj={}
obj.x=x
obj.y=y
obj.width=w
obj.height=h
obj.body=love.physics.newBody(world_selection,obj.x+obj.width/2,obj.y+obj.height/2,"static")
obj.shape=love.physics.newRectangleShape(obj.width,obj.height)
obj.fixture=love.physics.newFixture(obj.body,obj.shape,1)
obj.fixture:setRestitution(world_selection==world and 1 or 0)
obj.fixture:setFriction(0)
if(x>=0 and y>=0 and x<WINDOW_WIDTH and y<WINDOW_HEIGHT)then
  obj.fixture:setUserData("invisible_enemy")
else
  obj.fixture:setUserData("visible_enemy")
end
return obj
end
