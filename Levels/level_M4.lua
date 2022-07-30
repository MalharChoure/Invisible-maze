level_M4 = Class{}

function level_M4:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=275,y=0,width=25,height=75},{x=0,y=175,width=100,height=25},{x=175,y=100,width=25,height=400},{x=375,y=75,width=25,height=175}
,{x=375,y=75,width=25,height=175},{x=475,y=75,width=25,height=250},{x=625,y=100,width=25,height=700},{x=275,y=175,width=25,height=150},{x=75,y=275,width=100,height=25},{x=0,y=375,width=100,height=25},{x=0,y=450,width=175,height=25}
,{x=275,y=325,width=275,height=25},{x=275,y=350,width=25,height=100},{x=525,y=350,width=25,height=100},{x=375,y=450,width=175,height=25},{x=550,y=450,width=75,height=25},{x=725,y=500,width=75,height=25},{x=200,y=500,width=25,height=25}
,{x=225,y=525,width=25,height=25},{x=250,y=550,width=300,height=25},{x=525,y=575,width=25,height=150},{x=275,y=625,width=175,height=25},{x=100,y=575,width=75,height=25},{x=150,y=600,width=25,height=200},{x=250,y=625,width=25,height=100}
,{x=275,y=725,width=175,height=25},{x=450,y=625,width=25,height=100}}
  self.p_attributes={725,600,15}
  self.goal={{x=50,y=700,width=50,height=50}}
  self.bullet_count=28
  self.enemy_attribute={{x=725,y=750,radius=15,detection_radius=200},{x=400,y=400,radius=15,detection_radius=300}}
end
