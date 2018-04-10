
local elevatorDoorDuration = 3

return {
  --{"loadImage", "p1-bg", "assets/storyboards/p1-bg.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p1-s1", "assets/storyboards/p1-s1.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p1-s2", "assets/storyboards/p1-s2.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p1-s3", "assets/storyboards/p1-s3.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadSoundEffect", "lift-open", "assets/sounds/lift-open.wav"},

  {"setBG", "p1-bg"},
  {"show", "p1-s1"},
  {"show", "p1-s2"},
  {"show", "p1-s3"},

  {"doTween", "p1-s2", elevatorDoorDuration, {pos = {x = 595 }}, 'linear'},
  {"doTween", "p1-s3", elevatorDoorDuration, {pos = {x = -595}}, 'linear'},

  {"play", "lift-open"},  
  {"pauseExecution", elevatorDoorDuration}, -- Stops executing for an amount of time, this is useful for making sure a bunch of stuff doesn't happen while your tweens are running for example



  {"clear", "p2-bg"},
  {"pauseExecution", 2}, -- MAGIC NUMBER


  {"clear", "p1-bg"},
  {"show", "p3-bg"},
  {"show", "p3-s1"},

  {"doTween", "p3-s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1-bg", 2, {pos = {x = -50 * 1}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "p3-s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1-bg", 2, {pos = {x = -50 * 2}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "p3-s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1-bg", 2, {pos = {x = -50 * 3}}, "linear"},
  {"pauseExecution", 2},




  {"clear", "p4-bg"},
  {"show", "p4-s1"},
  {"addText", "t", "hey!", {pos = {x = 1000, y = 50}, color = {000, 000, 000}} },
  {"pauseExecution", 2},



  {"clear", "p5-bg"},
  {"show", "p5-s1"},

  {"doTween", "p5-s1", 2, {pos = {x = -50}}, "linear"},
  {"pauseExecution", 2},



  {"clear", "p6-bg"},
  {"pauseExecution", 2},



  {"clear", "p7-bg"},
  {"addText", "t", "That thing she is saying here...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p8-bg"},
  {"addText", "t", "The other thing she is saying there...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p9-bg"},
  {"addText", "t", "wooah!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  

  {"clear", "p10-bg"},
  {"waitForInput"},
  
  
  {"clear", "p11-bg"},
  {"waitForInput"},


  {"clear", "p12-bg"},
  {"waitForInput"},
  
  
  {"clear", "p13-bg"},
  {"waitForInput"},
  
  
  {"clear", "p14-bg"},
  {"waitForInput"},


  {"clear", "p15-bg"},
  {"waitForInput"},
  
  
  {"clear", "p16-bg"},
  {"waitForInput"},
  
  
  {"clear", "p17-bg"},
  {"waitForInput"},
  
  
  {"clear", "p18-bg"},
  {"waitForInput"},
  
  
  {"clear", "p19-bg"},
  {"waitForInput"},
  
  
  {"clear", "p20-bg"},
  {"waitForInput"},


  {"clear", "p21-bg"},
  {"waitForInput"},
  
  
  {"clear", "p22-bg"},
  {"waitForInput"},
  
  
  {"clear", "p23-bg"},
  {"waitForInput"},
  
  
  {"clear", "p24-bg"},
  {"waitForInput"},
  
  
  {"clear", "p25-bg"},
  {"waitForInput"},
  
  
  {"clear", "p26-bg"},
  {"waitForInput"},
  
  
  {"clear", "p27-bg"},
  {"waitForInput"},
  
  
  {"clear", "p28-bg"},
  {"waitForInput"},
  
  
  {"clear", "p29-bg"},
  {"waitForInput"},
  
  
  {"clear", "p30-bg"},
  {"waitForInput"},
  
  
  {"clear", "p31-bg"},
  {"waitForInput"},
  
  
  {"clear", "p32-bg"},
  {"waitForInput"},
  
  
  {"clear", "p33-bg"},
  {"waitForInput"},
  
  
  {"clear", "p34-bg"},
  {"waitForInput"},
  
  
  {"clear", "p35-bg"},
  {"waitForInput"},
  
  
  {"clear", "p36-bg"},
  {"waitForInput"},
  
  
  {"clear", "p37-bg"},
  {"waitForInput"},
  
  
  {"clear", "p38-bg"},
  {"waitForInput"},
  
  
  {"clear", "p39-bg"},
  {"waitForInput"},
  
  
  {"clear", "p40-bg"},
  {"waitForInput"},
  
  
  {"clear", "p41-bg"},
  {"waitForInput"},
  
  
  {"clear", "p42-bg"},
  {"waitForInput"},
  
  
  {"clear", "p43-bg"},
  {"waitForInput"},
  
  
  {"clear", "p44-bg"},
  {"waitForInput"},
  
  
  {"clear", "p45-bg"},
  {"waitForInput"},
  
  
  {"clear", "p46-bg"},
  {"waitForInput"},
  
  
  {"clear", "p47-bg"},
  {"waitForInput"},
  
  
  {"clear", "p48-bg"},
  {"waitForInput"},
  
  
  {"clear", "p49-bg"},
  {"waitForInput"},
  
  
  {"clear", "p50-bg"},
  {"waitForInput"},
  
  
  {"clear", "p51-bg"},
  {"waitForInput"},
  
  
  {"clear", "p52-bg"},
  {"waitForInput"},
  
  
  {"clear", "p53-bg"},
  {"waitForInput"},
  
  
  {"clear", "p54-bg"},
  {"waitForInput"},
  
  
  {"clear", "p55-bg"},
  {"waitForInput"},
  
  
  {"clear", "p56-bg"},
  {"waitForInput"},
  
  
  {"clear", "p57-bg"},
  {"waitForInput"},
  
  
  {"clear", "p58-bg"},
  {"waitForInput"},
  
  
  {"clear", "p59-bg"},
  {"waitForInput"},
  
  
  {"clear", "p60-bg"},
  {"waitForInput"},
  
  
  {"clear", "p61-bg"},
  {"waitForInput"},
  
  
  {"clear", "p62-bg"},
  {"waitForInput"},
  
  
  {"clear", "p63-bg"},
  {"waitForInput"},
  
  
  {"clear", "p64-bg"},
  {"waitForInput"},
  
  
  {"clear", "p65-bg"},
  {"waitForInput"},
  
  
  {"clear", "p66-bg"},
  {"waitForInput"},
  
  
  
  
  {"clear", "endMarker"},
}