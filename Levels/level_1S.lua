level_1S = Class{}

function level_1S:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},
  {x=0,y=-10,width=WINDOW_WIDTH,height=10},
  {x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},
  {x=0,y=25,width=225,height=25},{x=0,y=75,width=225,height=25},{x=75,y=125,width=25,height=325},{x=250,y=75,width=25,height=275},{x=450,y=75,width=25,height=275}
,{x=575,y=25,width=225,height=25},{x=550,y=250,width=25,height=300},{x=600,y=250,width=25,height=300},{x=225,y=375,width=300,height=25},{x=175,y=435,width=350,height=25},{x=0,y=450,width=25,height=50},{x=700,y=250,width=100,height=25},{x=700,y=350,width=100,height=25},{x=700,y=450,width=100,height=25}
,{x=700,y=550,width=100,height=25},{x=700,y=650,width=100,height=25},{x=300,y=550,width=25,height=100},{x=350,y=650,width=200,height=25},{x=200,y=525,width=25,height=250}}
  self.p_attributes={375,50,15}
  self.goal={{x=0,y=600,width=50,height=50}}
  self.bullet_count=18
  self.enemy_attribute={}
end
