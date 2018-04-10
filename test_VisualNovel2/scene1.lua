
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


  --{"loadImage", "p2-bg", "assets/storyboards/p2-bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"clear", "p2-bg"},
  {"pauseExecution", 2}, -- MAGIC NUMBER


  --{"loadImage", "p3-bg", "assets/storyboards/p3-bg.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p3-s1", "assets/storyboards/p3-s1.png", {scale = {x = 3.23, y = 3.23}}},

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



  --{"loadImage", "p4-bg", "assets/storyboards/p4-bg.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p4-s1", "assets/storyboards/p4-s1.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p4-bg"},
  {"show", "p4-s1"},
  {"addText", "t", "hey!", {pos = {x = 1000, y = 50}, color = {000, 000, 000}} },
  {"pauseExecution", 2},


  --{"loadImage", "p5-bg", "assets/storyboards/p5-bg.png", {scale = {x = 3.23, y = 3.23}}},
  --{"loadImage", "p5-s1", "assets/storyboards/p5-s1.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p5-bg"},
  {"show", "p5-s1"},

  {"doTween", "p5-s1", 2, {pos = {x = -50}}, "linear"},
  {"pauseExecution", 2},


  --{"loadImage", "p6-bg", "assets/storyboards/p6-bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p6-bg"},
  {"pauseExecution", 2},


  --{"loadImage", "p7-bg", "assets/storyboards/p7-bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p7-bg"},
  {"addText", "t", "That thing she is saying here...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},


  --{"loadImage", "p8-bg", "assets/storyboards/p8-bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p8-bg"},
  {"addText", "t", "The other thing she is saying there...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},


  --{"loadImage", "p9-bg", "assets/storyboards/p9-bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p9-bg"},
  {"addText", "t", "wooah!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  --{"loadImage", "endMarker", "assets/storyboards/endMarker.png", {scale = {x = 3.23, y = 3.23}}},
  {"clear", "endMarker"},


}