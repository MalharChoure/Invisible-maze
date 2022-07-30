level_k3 = Class{}

function level_k3:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=0,y=50,width=225,height=25},{x=0,y=75,width=25,height=225},{x=575,y=50,width=225,height=25},{x=775,y=75,width=25,height=225},{x=300,y=150,width=50,height=50}
  ,{x=450,y=150,width=25,height=50},{x=375,y=225,width=25,height=50},{x=300,y=300,width=25,height=50},{x=450,y=300,width=25,height=50},{x=225,y=375,width=25,height=50},{x=375,y=375,width=25,height=50},{x=525,y=375,width=50,height=50}
  ,{x=150,y=450,width=25,height=50},{x=300,y=450,width=25,height=50},{x=300,y=450,width=25,height=50},{x=450,y=450,width=25,height=50},{x=600,y=450,width=25,height=50},{x=375,y=525,width=25,height=50},{x=0,y=500,width=75,height=25}
  ,{x=725,y=500,width=75,height=25},{x=0,y=725,width=75,height=25},{x=725,y=725,width=75,height=25},{x=300,y=600,width=25,height=100},{x=450,y=600,width=25,height=100}}
  self.p_attributes={385,770,15}
  self.goal={{x=355,y=300,width=50,height=50},{x=355,y=450,width=50,height=50},{x=300,y=0,width=50,height=50}}
  self.bullet_count=18
  self.enemy_attribute={{x=25,y=0,radius=20,detection_radius=200},{x=750,y=0,radius=20,detection_radius=200},{x=225,y=450,radius=20,detection_radius=200},{x=550,y=450,radius=20,detection_radius=200}}
end
