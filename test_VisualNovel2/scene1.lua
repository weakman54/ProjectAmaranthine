
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
  {"addText", "E1", "(Oh.)", {pos = {x = 0, y = 1080 - 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "(That's Quit...)", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "p8-bg"},
  
  {"play", "Jump2"},
  
  {"addText", "E1", "(... all the more reason to leave as quickly as possible.)", {pos = {x = 0, y = 1080 - 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "Z1", "...Okay.", {pos = {x = 0, y = 650}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "E1", "End: Tsk", {pos = {x = 0, y = 1080- 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "E2", "What happened!?", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  
  
  
  {"clear", "p37-bg"},
  {"addText", "Z1", "*Whimper*", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "E2", "STOP IT!!", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "E1", "Cant do that, Zero!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "p46-bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p47-bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p48-bg"},
  {"addText", "E1", "Hmph!", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
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
  {"addText", "Z1", "I don't want you to fight anymore!!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Bam"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p53-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p54-bg"},
  {"waitForInput"},
  
  
  
  {"clear", "p55-bg"},
  {"play", "Bam"},
  {"addText", "E1", "You honestly expect us to be able to walk out of here if we ask nicely enough!?", {pos = {x = 1920 - 700, y = 200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "E2", "Dont be an idiot! This is the only way", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  
  {"waitForInput"},
  
  
  
  {"clear", "p56-bg"},
  {"addText", "E1", "There is a lot of bullshit going on here, so I don't expect you to understand everything.", {pos = {x = 1920 - 650, y = 200}, color = {000, 000, 000}, width = 620} },
  {"waitForInput"},
  {"addText", "E2", "But the least you could do is keep up and stop acting like a baby.", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p57-bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "p58-bg"},
  {"addText", "Z1", "*Sob, sob*", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p59-bg"},
  {"addText", "Z1", "*CRYING!*", {pos = {x = 700, y = 1080-200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p60-bg"},
  {"addText", "Z1", "You are stupid,End!", {pos = {x = 1920 - 650, y = 400}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "Z2", "You are a fake...", {pos = {x = 1920 - 550, y = 500}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "Z3", "...not real!", {pos = {x = 1920 - 400, y = 600}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p61-bg"},
  {"addText", "E1", "The hell...?", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p62-bg"},
  {"play", "Damage2"},
  {"play", "Damage3"},
  {"play", "Earth2"},
  {"waitForInput"},
  
  
  
  {"clear", "p63-bg"},
  {"addText", "Z1", "Ow!", {pos = {x = 1920 - 1000, y = 500}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p64-bg"},
  {"addText", "E1", "Get back here!", {pos = {x = 1920 - 800, y = 300}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p65-bg"},
  {"addText", "E1", "Zero!", {pos = {x = 300, y = 200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "p66-bg"},
  {"addText", "Z1", "For fuck's sake...", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  {"gotoBattle", stateBattle},
  
  
  {"clear", "endMarker"},
}