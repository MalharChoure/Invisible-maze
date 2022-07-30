level_2k = Class{}

function level_2k:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=100,y=650,width=425,height=25},{x=525,y=125,width=25,height=525},{x=40,y=25,width=20,height=525},{x=200,y=200,width=25,height=100},
  {x=350,y=200,width=25,height=100},{x=200,y=350,width=25,height=100},{x=350,y=350,width=25,height=100},{x=575,y=125,width=125,height=25},{x=600,y=175,width=100,height=25},{x=625,y=225,width=50,height=25},
  {x=625,y=425,width=50,height=25},{x=600,y=475,width=100,height=25},{x=575,y=525,width=150,height=25},{x=775,y=75,width=25,height=25},{x=775,y=125,width=25,height=25},{x=775,y=175,width=25,height=25},
  {x=775,y=225,width=25,height=25},{x=775,y=275,width=25,height=25},{x=775,y=325,width=25,height=25},{x=775,y=375,width=25,height=25},{x=775,y=425,width=25,height=25},{x=775,y=475,width=25,height=25},
  {x=775,y=525,width=25,height=25},{x=775,y=575,width=25,height=25},{x=650,y=650,width=150,height=25}}
  self.p_attributes={30,770,15}
  self.goal={{x=600,y=0,width=50,height=50}}
  self.bullet_count=25
  self.enemy_attribute={}
end
