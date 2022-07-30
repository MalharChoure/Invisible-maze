WINDOW_WIDTH = 800
WINDOW_HEIGHT = 800
here=0

-- Require Files --
Class = require 'class'
require 'States/BaseState'
require 'StateMachine'
require 'States/TitleScreenState'
require 'States/PlayState'
require 'States/InstructionState'
require 'States/VictoryState'
require 'States/LoseState'
require 'States/LevelSelectState'
require "Game_Assets/player"
require "Game_Assets/bullets"
require "Game_Assets/enemy"
require "Levels/level_k1"
require "Levels/level_2k"
require "Levels/level_1M"
require "Levels/level_2M"
require "Levels/level_M3"
require "Levels/level_k3"
require "Levels/y_1"
require "Levels/level_M4"
require "Levels/level_y4"
require "Levels/level_1S"
require "Levels/Level_initializer"
push = require "push"

------level storage without trigger
level_obj={level_k1,level_2k,level_1M,y_1,level_k3,level_2M,level_M3,level_M4,level_y4,level_1S}
level_max=#level_obj

function love.load()
  wind_x,wind_y=love.window.getMode()
  love.window.setTitle("Invisible Maze")
  push:setupScreen(WINDOW_WIDTH, WINDOW_HEIGHT,wind_x,wind_y,{
      vsync = true,
      fullscreen = true,
      resizable = true,
      pixelperfect=false, highdpi = true ,stretched = false
  })
  love.graphics.setFont(love.graphics.newFont(40))
  gStateMachine=StateMachine
 {
   ['title']= function() return TiTleScreenState() end,
   ['play']= function() return PlayState() end,
   ['instruction']= function() return InstructionState() end,
   ['victory']= function() return VictoryState() end,
   ['level select']= function() return LevelSelectState() end,
   ['loss']= function() return LoseState() end
 }
 gStateMachine:change('title')
love.mouse.buttonsPressed = {}
keyboard_check={}
--------------------------------------------------------------------------------sounds and drawables
play_background_image=love.graphics.newImage("drawable_assets/v02.png")
--wall_image={love.graphics.newImage("")}
play_wall_image=love.graphics.newImage("drawable_assets/walls.jpg")
goal_image=love.graphics.newImage("drawable_assets/exit.png")
lives_image=love.graphics.newImage("drawable_assets/lives.png")
paintball=love.graphics.newImage("drawable_assets/shot.png")
ball_wall_sound=love.audio.newSource("GameSounds/BallHittingWall.wav","stream")
enemy_hit_sound=love.audio.newSource("GameSounds/GettingHitByEnemy.wav","stream")
victory_sound=love.audio.newSource("GameSounds/Goal.wav","stream")
player_hitting_wall_sound=love.audio.newSource("GameSounds/PlayerHittingTheWall.wav","stream")
player_losing=love.audio.newSource("GameSounds/PlayerLosing.wav","stream")

  love.graphics.setFont(love.graphics.newFont(40))
end

function love.resize(w,h)
  push:resize(w,h)
end

function love.update(dt)
  gStateMachine:update(dt)
  love.mouse.buttonsPressed = {}
  keyboard_check={}
end


function love.mousepressed(x, y, button, isTouch)
  love.mouse.buttonsPressed[button] = true
  x1,y1=push:toGame(x,y)

  if x1~=nil and y1~=nil then
     gStateMachine:checking(x1,y1)
  end
end

function love.keypressed(key, scancode, isrepeat)
  keyboard_check[key]=true
  -- if key == 'escape' then
  --   love.event.quit()
  -- end
  gStateMachine:check_key_pressed(key)
end

function Keyboard_was_Pressed(key)
  if keyboard_check[key] then
    return true
  else
    return false
  end
end

function love.mouse.wasPressed(button)
    if love.mouse.buttonsPressed[button] then
      return true
    else
      return false
    end
end

function love.keyreleased(key)
  gStateMachine:check_key_released(key)
end


function love.draw()
  love.graphics.setFont(love.graphics.newFont(40))
   push:start()
   gStateMachine:render()
   --love.graphics.print(here)
   push:finish()
end
