level_M3 = Class{}

function level_M3:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=150,y=0,width=25,height=150},{x=475,y=0,width=25,height=100},{x=125,y=150,width=275,height=25},{x=100,y=150,width=25,height=300},{x=575,y=150,width=25,height=50}
,{x=375,y=175,width=25,height=175},{x=475,y=200,width=25,height=250},{x=500,y=200,width=200,height=25},{x=125,y=425,width=275,height=25},{x=675,y=225,width=25,height=200},{x=500,y=425,width=200,height=25},{x=0,y=525,width=400,height=25}
,{x=500,y=525,width=300,height=25},{x=250,y=625,width=25,height=175},{x=400,y=625,width=400,height=25}}
  self.p_attributes={750,750,15}
  self.goal={{x=150,y=200,width=50,height=50}}
  self.bullet_count=20
  self.enemy_attribute={{x=250,y=300,radius=15,detection_radius=325},{x=600,y=350,radius=15,detection_radius=200}}
end
