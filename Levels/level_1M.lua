level_1M = Class{}

function level_1M:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=625,y=650,width=25,height=150},{x=725,y=550,width=75,height=25},{x=550,y=550,width=100,height=25},{x=450,y=650,width=175,height=25},{x=450,y=450,width=25,height=200}
,{x=350,y=650,width=100,height=25},{x=300,y=450,width=150,height=25},{x=175,y=650,width=25,height=150},{x=175,y=375,width=25,height=200},{x=0,y=350,width=200,height=25},{x=550,y=350,width=25,height=200},{x=300,y=350,width=250,height=25}
,{x=450,y=200,width=350,height=25},{x=550,y=100,width=25,height=100},{x=250,y=100,width=200,height=25}}
  self.p_attributes={750,750,15}
  self.goal={{x=500,y=700,width=50,height=50},{x=700,y=50,width=50,height=50}}
  self.bullet_count=18
  self.enemy_attribute={}
end
