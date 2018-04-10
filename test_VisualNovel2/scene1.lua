
local elevatorDoorDuration = 3

return {
  {"loadImage", "p1bg", "assets/storyboards/page1p1bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p1s1", "assets/storyboards/page1p1s1.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p1s2", "assets/storyboards/page1p1s2.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p1s3", "assets/storyboards/page1p1s3.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadSoundEffect", "lift-open", "assets/sounds/lift-open.wav"},

  {"setBG", "p1bg"},
  {"show", "p1s1"},
  {"show", "p1s2"},
  {"show", "p1s3"},

  {"doTween", "p1s2", elevatorDoorDuration, {pos = {x = 595 }}, 'linear'},
  {"doTween", "p1s3", elevatorDoorDuration, {pos = {x = -595}}, 'linear'},

  {"play", "lift-open"},  
  {"pauseExecution", elevatorDoorDuration}, -- Stops executing for an amount of time, this is useful for making sure a bunch of stuff doesn't happen while your tweens are running for example


  {"loadImage", "p2bg", "assets/storyboards/page1p2bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"clear", "p2bg"},
  {"pauseExecution", 2}, -- MAGIC NUMBER


  {"loadImage", "p3bg", "assets/storyboards/page1p3bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p3s1", "assets/storyboards/page1p3s1.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p1bg"},
  {"show", "p3bg"},
  {"show", "p3s1"},

  {"doTween", "p3s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1bg", 2, {pos = {x = -50 * 1}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "p3s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1bg", 2, {pos = {x = -50 * 2}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "p3s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "p1bg", 2, {pos = {x = -50 * 3}}, "linear"},
  {"pauseExecution", 2},



  {"loadImage", "p4bg", "assets/storyboards/page1p4bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p4s1", "assets/storyboards/page1p4s1.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p4bg"},
  {"show", "p4s1"},
  {"addText", "t", "hey!", {pos = {x = 1000, y = 50}, color = {000, 000, 000}} },
  {"pauseExecution", 2},


  {"loadImage", "p5bg", "assets/storyboards/page1p5bg.png", {scale = {x = 3.23, y = 3.23}}},
  {"loadImage", "p5s1", "assets/storyboards/page1p5s1.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p5bg"},
  {"show", "p5s1"},

  {"doTween", "p5s1", 2, {pos = {x = -50}}, "linear"},
  {"pauseExecution", 2},


  {"loadImage", "p6bg", "assets/storyboards/page1p6bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p6bg"},
  {"pauseExecution", 2},


  {"loadImage", "p7bg", "assets/storyboards/page1p7bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p7bg"},
  {"addText", "t", "That thing she is saying here...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},


  {"loadImage", "p8bg", "assets/storyboards/page1p8bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p8bg"},
  {"addText", "t", "The other thing she is saying there...", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},


  {"loadImage", "p9bg", "assets/storyboards/page1p9bg.png", {scale = {x = 3.23, y = 3.23}}},

  {"clear", "p9bg"},
  {"addText", "t", "wooah!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"loadImage", "endMarker", "assets/storyboards/endMarker.png", {scale = {x = 3.23, y = 3.23}}},
  {"clear", "endMarker"},


}