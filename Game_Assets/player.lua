player = Class{}


function player:init(x,y,radius)
  self.radius=radius
  self.x=x
  self.y=y
  self.body=love.physics.newBody(world_bullet,self.x,self.y,"dynamic")
  self.shape=love.physics.newCircleShape(self.radius)
  self.fixture=love.physics.newFixture(self.body,self.shape,1)
  self.fixture:setRestitution(1)
  self.dx=0
  self.dy=0
  self.fixture:setUserData("player")
  self.angle=0
  self.angle=math.atan2(self.dy,self.dx)
  lastx=0
  lasty=0
end

function player:update(dt)
  if love.keyboard.isDown("d") then
    self.dx=1
    lastx=self.dx
    lasty=0
  elseif love.keyboard.isDown("a") then
    self.dx=-1
    lastx=self.dx
    lasty=0
  end
  if love.keyboard.isDown("w") then
    self.dy=-1
    lasty=self.dy
    lastx=0
  elseif love.keyboard.isDown("s") then
    self.dy=1
    lasty=self.dy
    lastx=0
  end
  self.body:setLinearVelocity(8000*self.dx*dt,8000*self.dy*dt)
  if(self.dy==0 and self.dx==0)then
    self.angle=math.atan2(lasty,lastx)
  else
    self.angle=math.atan2(self.dy,self.dx)
  end
end


function player:draw()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(love.graphics.newImage("drawable_assets/player.png"),self.body:getX(),self.body:getY(),self.angle,1,1,self.radius,self.radius)
end

function player:check_key_released(key)
  if(key=='w' or key=='a' or key=='s' or key=='d')then
    self.dx=0
    self.dy=0
  end
end
