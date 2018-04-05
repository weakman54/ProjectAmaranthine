
return {
  {"loadImage", "bg1", "assets/bg1.png", {offset = {x = 200, y = 200}}},  
  {"loadImage", "bg2", "assets/bg2.png", {offset = {x = 200, y = 200}}},
  {"loadAnim", "dude", {"assets/thing.png", "assets/thing2.png"}},

  {"setBG", "bg1"},
  {"waitForInput"},
  
  {"show", "dude"},
  {"waitForInput"},
  
  {"setBG", "bg2"},
  {"hide", "dude"},
  {"waitForInput"},
  
  {"setPosition", "dude", 100, 100},
  {"show", "dude"},
  {"waitForInput"},
  
  {"setOffset", "dude", 40, 30},
  
  {"doTween", "dude", 10, {pos = {x = 200, y = 200}}, 'in-out-quad'}
}