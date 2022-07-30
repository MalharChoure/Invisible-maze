InstructionState = Class{__includes = BaseState}

function InstructionState:init()
  self.ww = 800
  self.wh = 800
  self.mouse_x=0
  self.mouse_y=0
end

function InstructionState:render()             -------renders Instrutions

  love.graphics.setColor(1,1,1)
  love.graphics.draw(love.graphics.newImage("drawable_assets/home_button.png"),20,10)

  love.graphics.setFont(love.graphics.newFont(40))
  love.graphics.printf("Game Instructions",0, 10,self.ww, 'center')
  love.graphics.setColor(1,0,0)
  love.graphics.printf("Controls",0,70,self.ww,'center')
  love.graphics.setFont(love.graphics.newFont(25))
  love.graphics.setColor(0,1,1)
  love.graphics.printf("W = Move Forward",5,150,self.ww/2 )
  love.graphics.printf("A = Move Right",5,200,self.ww/2)
  love.graphics.printf("S = Move Backward",5,250,self.ww)
  love.graphics.printf("D = Move Right",5,300,self.ww/2)
  love.graphics.printf("Left Mouse Button = Shooting The Bullet",5,350,self.ww)

  love.graphics.setFont(love.graphics.newFont(35))
  love.graphics.setColor(1,0,0)
  love.graphics.printf("How To Play",0,410,self.ww,'center')
  love.graphics.setFont(love.graphics.newFont(25))
  love.graphics.setColor(0,1,1)
  love.graphics.printf("Clear The Maze By Shooting Bullets Which Will Enlighten The Walls In Between Your Initial Position And Your Goal.",0,480,self.ww)
  love.graphics.printf("In Some Levels You Will Face Enemies As Well , Having A Perticular Detection Radius.If You Are Within Their Range They Will Follow You. But Enemies can't Cross The Wall.",0,550,self.ww)
  love.graphics.printf("There May Be Multiple Ways To Complete A Level.",0,650,self.ww)
  love.graphics.printf("If You Hit Any Of The Wall In Between or Enemies or Boundries Of The Room , Then You Will Loose One of Your Life And You Again Have To Start From Your Initial Position",0,700,self.ww)
end

function InstructionState:checking(x,y)
  if(x>20 and y>10 and x<80 and y<70)then
    gStateMachine:change('title')
  end
end
