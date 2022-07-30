level_2M = Class{}

function level_2M:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=75,y=0,width=25,height=200},{x=200,y=50,width=175,height=25},{x=625,y=0,width=25,height=275},{x=725,y=0,width=25,height=275},{x=625,y=275,width=125,height=25},{x=200,y=150,width=25,height=100},{x=75,y=200,width=125,height=25}
,{x=200,y=250,width=150,height=25},{x=450,y=275,width=150,height=25},{x=325,y=300,width=25,height=200},{x=450,y=300,width=25,height=200},{x=625,y=350,width=25,height=150},{x=650,y=450,width=100,height=25},{x=0,y=500,width=150,height=25}
,{x=150,y=500,width=200,height=25},{x=450,y=500,width=200,height=25},{x=0,y=575,width=100,height=25},{x=150,y=525,width=25,height=175},{x=250,y=600,width=25,height=125},{x=275,y=600,width=250,height=25},{x=525,y=600,width=25,height=125},{x=250,y=725,width=300,height=25},{x=600,y=600,width=200,height=25}}
  self.p_attributes={400,400,15}
  self.goal={{x=250,y=350,width=50,height=50},{x=500,y=350,width=50,height=50}}
  self.bullet_count=18
  self.enemy_attribute={}
end
