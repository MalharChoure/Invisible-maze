y_1 = Class{}

function y_1:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=175,y=690,width=225,height=25},{x=100,y=600,width=25,height=190},{x=420,y=550,width=25,height=135},
  {x=450,y=600,width=150,height=25},{x=425,y=225,width=125,height=25},{x=100,y=225,width=175,height=25},
  {x=150,y=350,width=25,height=125},{x=175,y=350,width=150,height=25},{x=325,y=350,width=25,height=125},{x=150,y=475,width=200,height=25},{x=400,y=325,width=200,height=25},{x=50,y=350,width=25,height=100}}
  self.p_attributes={175,750,15}
  self.goal={{x=300,y=200,width=50,height=50}}
  self.bullet_count=11
  self.enemy_attribute={}
end
