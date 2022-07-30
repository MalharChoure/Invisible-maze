enemy = Class{}

function enemy:init(x,y,radius,target_radius)
  self.x=x
  self.y=y
  self.radius=radius
  self.body=love.physics.newBody(world_bullet,self.x,self.y,"dynamic")
  self.shape=love.physics.newCircleShape(self.radius)
  self.fixture=love.physics.newFixture(self.body,self.shape,1)
  self.start_x=x
  self.start_y=y
  self.fixture:setRestitution(0)
  self.speed=0
  self.angle=0
  self.fixture:setUserData("monster")
  self.target_radius=target_radius
  self.player_look=0
end

function enemy:update(dt)
  for k,v in pairs(player_life)do
    dist=math.floor(math.sqrt(((v.body:getX()-self.body:getX())^2)+((v.body:getY()-self.body:getY())^2)))
    self.player_look=math.atan2(v.body:getY()-self.body:getY() , v.body:getX()-self.body:getX())
    if(dist<self.target_radius)then
      self.angle=math.atan2(v.body:getY()-self.body:getY() , v.body:getX()-self.body:getX())
    elseif(persisting==1)then
      self.angle=0
    else
      self.angle=0
    end
  end
  if(self.angle==0)then
    self.body:setLinearVelocity(0,0)
  else
    self.body:setLinearVelocity(6000*math.cos(self.angle)*dt,6000*math.sin(self.angle)*dt)
  end
end

function enemy:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(love.graphics.newImage("drawable_assets/zombie.png"),self.body:getX(),self.body:getY(),self.player_look,1,1,self.radius,self.radius)
end
