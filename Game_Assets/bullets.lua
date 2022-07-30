bullets = Class{}

function bullets:init(x,y,angle)
  self.radius=5
  self.x=x
  self.y=y
  self.angle=angle---2*math.pi-angle
  self.body=love.physics.newBody(world,self.x,self.y,"dynamic")
  self.shape=love.physics.newCircleShape(self.radius)
  self.fixture=love.physics.newFixture(self.body,self.shape,1)
  self.fixture:setRestitution(1)
  self.fixture:setFriction(0)
  self.dx=5000*math.cos(angle)
  self.dy=5000*math.sin(angle)
  self.body:applyForce(self.dx,self.dy)
  self.fixture:setUserData("bullet")
  self.timer=0
  self.max_time_limit=20
end

function bullets:update(dt)
  self.timer=self.timer+dt
end


function bullets:draw()
  love.graphics.setColor(1,0,0,1)
  love.graphics.draw(paintball,self.body:getX(),self.body:getY(),0,1,1,5,5)
end
