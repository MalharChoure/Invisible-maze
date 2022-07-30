level_k1 = Class{}

function level_k1:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=100,y=625,width=150,height=25},{x=300,y=625,width=200,height=25},{x=550,y=625,width=150,height=25},
  {x=50,y=300,width=25,height=250},{x=125,y=300,width=25,height=250},{x=650,y=300,width=25,height=250},{x=725,y=300,width=25,height=250},{x=0,y=0,width=300,height=25},{x=500,y=0,width=300,height=25},{x=300,y=150,width=200,height=25}}
  self.p_attributes={385,770,15}
  self.goal={{x=375,y=0,width=50,height=50}}
  self.bullet_count=13
  self.enemy_attribute={}
end
