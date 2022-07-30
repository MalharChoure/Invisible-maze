
VictoryState = Class{__includes = BaseState}

function VictoryState:init()

  self.mouse_x=0
  self.mouse_y=0


  self.Menu_selection={} ----------------------------------------------------------------empty table for storing coordinates of rectangles
  for i=0,3 do
    table.insert(self.Menu_selection,{name={"Next Level","Replay","Levels","Exit"},x=WINDOW_WIDTH/2-150,y=WINDOW_HEIGHT/2-50+100*i,width=300,height=60,collide=false})
  end
  love.audio.play(victory_sound)
end
-------------------------------------------------------------checking for mouse clicking---------------------------------
function VictoryState:update(dt)

  self.mouse_x,self.mouse_y=push:toGame(love.mouse.getX(),love.mouse.getY())

  for keys,values in pairs(self.Menu_selection) do
    if self.mouse_x~=nil and self.mouse_y~=nil then
      if Rect_coll(values,self.mouse_x,self.mouse_y) then
         values.collide=true
      else
        values.collide=false
      end
    end
  end
end

----------------------------------------------------------------checking which option is select-------------------------
function VictoryState:checking(x,y)
  for keys,values in pairs(self.Menu_selection) do
    if Rect_coll(values,x,y) then
      if keys == 1 then
        current_level=current_level<level_max and current_level+1 or level_max
        Level_initializer(level_obj[current_level]())
        gStateMachine:change('play')
      elseif keys == 2 then
        Level_initializer(level_obj[current_level]())
        gStateMachine:change('play')
      elseif keys == 3 then
        gStateMachine:change('level select')
      elseif keys == 4 then
        love.event.quit()
      end
    end
  end
end

-------------------------------------------------------collision function----------------------------
function Rect_coll(values,x,y)
  return x<values.x+values.width and
        x+tonumber(2)>values.x and
        y<values.y+values.height and
        y+tonumber(2)>values.y
  end



function VictoryState:render()
 love.graphics.setColor(1,0,0)
 love.graphics.setLineWidth(4)
 love.graphics.printf("Congratulations!!!!\n Level completed successfully",0,50,WINDOW_WIDTH,'center')
-------------------------------------------------rendering rectangles--------------------------------------
  for keys,values in pairs(self.Menu_selection) do
    if values.collide == true then
      love.graphics.setColor(1,0,0)
      love.graphics.rectangle('line',values.x,values.y,values.width,values.height,20)
      love.graphics.printf(values.name[keys],values.x,values.y+10,values.width,'center')
    else
      love.graphics.setColor(1,1,1)
      love.graphics.rectangle('line',values.x,values.y,values.width,values.height,20)
      love.graphics.printf(values.name[keys],values.x,values.y+10,values.width,'center')
    end
  end
    love.graphics.setColor(1,1,1)
end
