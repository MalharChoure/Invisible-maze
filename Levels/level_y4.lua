level_y4 = Class{}

function level_y4:init()
  self.collidables={{x=-10,y=0,width=10,height=WINDOW_WIDTH},{x=0,y=-10,width=WINDOW_WIDTH,height=10},{x=WINDOW_WIDTH,y=0,width=10,height=WINDOW_HEIGHT},
  {x=0,y=WINDOW_HEIGHT,width=WINDOW_WIDTH,height=10},{x=60,y=635,width=25,height=165},{x=0,y=575,width=150,height=25},
  {x=195,y=460,width=25,height=190},{x=225,y=700,width=25,height=100},{x=250,y=560,width=100,height=25},
  {x=335,y=650,width=25,height=75},{x=410,y=550,width=25,height=250},{x=475,y=550,width=25,height=150},
  {x=500,y=730,width=25,height=70},{x=600,y=700,width=25,height=100},{x=700,y=550,width=25,height=100},
  {x=650,y=375,width=150,height=25},{x=750,y=200,width=500,height=25},{x=0,y=50,width=WINDOW_WIDTH,height=25},
  {x=500,y=150,width=150,height=25},{x=260,y=100,width=25,height=75},{x=150,y=200,width=25,height=50},
  {x=200,y=200,width=25,height=50},{x=100,y=250,width=25,height=325},{x=125,y=250,width=175,height=25},
  {x=130,y=325,width=170,height=25},{x=230,y=380,width=25,height=170},{x=385,y=150,width=25,height=100},
  {x=325,y=275,width=225,height=25},{x=350,y=300,width=25,height=250},{x=375,y=350,width=175,height=25},
  {x=425,y=425,width=25,height=100},{x=550,y=250,width=25,height=165},{x=575,y=250,width=125,height=25},
  {x=625,y=300,width=25,height=50},{x=475,y=450,width=150,height=25},{x=575,y=480,width=25,height=170},
  {x=625,y=475,width=25,height=75}}
  self.p_attributes={25,765,10}
  self.goal={{x=50,y=150,width=50,height=50}}
  self.bullet_count=40
  self.enemy_attribute={}
end
