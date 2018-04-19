
local elevatorDoorDuration = 3

return {
  {"loadSoundEffect", "lift-open", "assets/sounds/lift-open.wav"},

  {"setBG", "p1-bg"},
  {"show", "p1-s1"},
  {"show", "p1-s2"},
  {"show", "p1-s3"},

  {"doTween", "p1-s2", elevatorDoorDuration, {pos = {x = 595 }}, 'linear'},
  {"doTween", "p1-s3", elevatorDoorDuration, {pos = {x = -595}}, 'linear'},

  {"play", "lift-open"},
  {"play", "Bell3"},  
  {"pauseExecution", elevatorDoorDuration}, -- Stops executing for an amount of time, this is useful for making sure a bunch of stuff doesn't happen while your tweens are running for example



  {"clear", "p2-bg"},
  {"pauseExecution", 2}, -- MAGIC NUMBER


  {"clear", "p1-bg"},
  {"show", "p3-bg"},
  
  {"play", "Move5"},
  
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
  
  {"play", "Jump1"},
  
  {"addText", "E1", "Huh...?!", {pos = {x = 1000, y = 50}, color = {000, 000, 000}} },
  {"pauseExecution", 2},



  {"clear", "p5-bg"},
  
  {"play", "Starlight"},
  
  {"show", "p5-s1"},

  {"doTween", "p5-s1", 2, {pos = {x = -50}}, "linear"},
  {"pauseExecution", 2},



  {"clear", "p6-bg"},
  
  {"pauseExecution", 2},



  {"clear", "p7-bg"},
  {"addText", "E1", "(Oh.)", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "(That's Quit...)", {pos = {x = 0, y = 1080 - 100}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p8-bg"},
  
  {"play", "Jump2"},
  
  {"addText", "E1", "(... all the more reason to leave as quickly as possible.)", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "Let's go, Zero.", {pos = {x = 0, y =1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p9-bg"},
  {"addText", "Z1", "Z: Wooah!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  


  {"clear", "p10-bg"},
  {"addText", "E1", "...", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"play", "Miss"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p11-bg"},
  {"addText", "Z1", "She looks happy, End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p12-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p13-bg"},
  {"addText", "E1", "Stop messing around, we need to get out of here.", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "Z1", "...Okay.", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p14-bg"},
  {"show", "p14-s1"},
  
  {"play", "Move5"},
  
  {"waitForInput"},



  {"clear", "p15-bg"},
  {"addText", "E1", "Ooh...", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"show", "p15-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p16-bg"},
  {"show", "p16-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p17-bg"},
  {"show", "p17-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p18-bg"},
  {"addText", "Z1", "End! Its a kitty!", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Miss"},
  {"pauseExecution", 1},
  {"addText", "E1", "End: Tsk", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p19-bg"},
  {"addText", "Z1", "Why is kitty not moving?", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"show", "p19-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p20-bg"},
  {"addText", "E1", "It's just a stuffed animal.", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"show", "p20-s1"},
  {"addText", "E2", "Come on, let's leave.", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p21-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p22-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p23-bg"},
  
  {"play", "Stare"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "p24-bg"},
  {"show", "p24-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p25-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "p26-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "p27-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "p28-bg"},
  {"show", "p28-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p29-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.75},
  
  
  {"clear", "p30-bg"},
  {"show", "p30-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p31-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "p32-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "p33-bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "p34-bg"},
  
  {"play", "Collapse2"},
  {"play", "Collapse1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p35-bg"},
  {"addText", "Z1", "AAAAAAAAAAaaaaaahh!!!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Scream"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p36-bg"},
  {"addText", "E1", "Huh!?", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "What happened!?", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  
  
  
  {"clear", "p37-bg"},
  {"addText", "Z1", "*Whimper*", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E1", "*Sigh*", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  
  
  
  {"clear", "p38-bg"},
  {"addText", "E1", "We SERIOUSLY don't have time for this!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Equip2"},
  {"play", "Wind1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p39-bg"}, 
  {"addText", "Z1", "Let me go!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p40-bg"},
  
  {"show", "p40-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p41-bg"},
  {"addText", "E1", "End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 0.5},
  {"addText", "E1", "STOP IT!!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p42-bg"},
  
  {"play", "Slash2"},
  {"play", "Absorb1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p43-bg"},
  {"addText", "E1", "OW! What the hell!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p44-bg"},
  {"addText", "E1", "I dont want to go anymore, End! Lets go back!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p45-bg"},
  {"addText", "E1", "I cant do that, Zero!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p46-bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p47-bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p48-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p49-bg"},
  {"show", "p49-s1"},
  {"waitForInput"},
  
  
  
  {"clear", "p50-bg"},
  {"addText", "E1", "It hurts people when you hit them, End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p51-bg"},
  {"addText", "E1", "I know!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p52-bg"},
  
  {"play", "Bam"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p53-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p54-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p55-bg"},
  
  {"play", "Bam"},
  
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
  
  {"play", "Damage2"},
  {"play", "Damage3"},
  {"play", "Earth2"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p63-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p64-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p65-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p66-bg"},
  {"waitForInput"},
  
  
  {"gotoBattle", stateBattle},
  
  
  {"clear", "endMarker"},
}