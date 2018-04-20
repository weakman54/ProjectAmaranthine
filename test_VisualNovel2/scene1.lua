
local elevatorDoorDuration = 3

return {
  {"loadSoundEffect", "lift-open", "assets/sounds/lift-open.wav"},

  {"setBG", "s01_p000_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p001_bg"},
  {"show", "s01_p001_s1"},
  {"show", "s01_p001_s2"},
  {"show", "s01_p001_s3"},

  {"doTween", "s01_p001_s2", elevatorDoorDuration, {pos = {x = 595 }}, 'linear'},
  {"doTween", "s01_p001_s3", elevatorDoorDuration, {pos = {x = -595}}, 'linear'},

  {"play", "lift-open"},
  {"play", "Bell3"},  
  {"pauseExecution", elevatorDoorDuration}, -- Stops executing for an amount of time, this is useful for making sure a bunch of stuff doesn't happen while your tweens are running for example



  {"clear", "s01_p002_bg"},
  {"pauseExecution", 2}, -- MAGIC NUMBER


  {"clear", "s01_p001_bg"},
  {"show", "s01_p003_bg"},
  
  {"play", "Move5"},
  
  {"show", "s01_p003_s1"},

  {"doTween", "s01_p003_s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "s01_p001_bg", 2, {pos = {x = -50 * 1}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "s01_p003_s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "s01_p001_bg", 2, {pos = {x = -50 * 2}}, "linear"},
  {"pauseExecution", 2},

  {"doTween", "s01_p003_s1", 2, {pos = {y = 10}}, "sin"},
  {"doTween", "s01_p001_bg", 2, {pos = {x = -50 * 3}}, "linear"},
  {"pauseExecution", 2},




  {"clear", "s01_p004_bg"},
  {"show", "s01_p004_s1"},
  
  {"play", "Jump1"},
  
  {"addText", "E1", "Huh...?!", {pos = {x = 1000, y = 50}, color = {000, 000, 000}} },
  {"pauseExecution", 2},



  {"clear", "s01_p005_bg"},
  
  {"play", "Starlight"},
  
  {"show", "s01_p005_s1"},

  {"doTween", "s01_p005_s1", 2, {pos = {x = -50}}, "linear"},
  {"pauseExecution", 2},



  {"clear", "s01_p006_bg"},
  
  {"pauseExecution", 2},



  {"clear", "s01_p007_bg"},
  {"addText", "E1", "(Oh.)", {pos = {x = 0, y = 1080 - 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "(That's Quit...)", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "s01_p008_bg"},
  
  {"play", "Jump2"},
  
  {"addText", "E1", "(... all the more reason to leave as quickly as possible.)", {pos = {x = 0, y = 1080 - 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "Let's go, Zero.", {pos = {x = 0, y =1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "s01_p009_bg"},
  {"addText", "Z1", "Z: Wooah!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  


  {"clear", "s01_p010_bg"},
  {"addText", "E1", "...", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"play", "Miss"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p011_bg"},
  {"addText", "Z1", "She looks happy, End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "s01_p012_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p013_bg"},
  {"addText", "E1", "Stop messing around, we need to get out of here.", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "Z1", "...Okay.", {pos = {x = 0, y = 650}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p014_bg"},
  {"show", "s01_p014_s1"},
  
  {"play", "Move5"},
  
  {"waitForInput"},



  {"clear", "s01_p015_bg"},
  {"addText", "E1", "Ooh...", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"show", "s01_p015_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p016_bg"},
  {"show", "s01_p016_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p017_bg"},
  {"show", "s01_p017_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p018_bg"},
  {"addText", "Z1", "End! Its a kitty!", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Miss"},
  {"pauseExecution", 1},
  {"addText", "E1", "End: Tsk", {pos = {x = 0, y = 1080- 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p019_bg"},
  {"addText", "Z1", "Why is kitty not moving?", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"show", "s01_p019_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p020_bg"},
  {"addText", "E1", "It's just a stuffed animal.", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"show", "s01_p020_s1"},
  {"addText", "E2", "Come on, let's leave.", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},



  {"clear", "s01_p021_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p022_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p023_bg"},
  
  {"play", "Stare"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "s01_p024_bg"},
  {"show", "s01_p024_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p025_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "s01_p026_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "s01_p027_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.5},
  
  
  
  {"clear", "s01_p028_bg"},
  {"show", "s01_p028_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p029_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 0.75},
  
  
  {"clear", "s01_p030_bg"},
  {"show", "s01_p030_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p031_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "s01_p032_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "s01_p033_bg"},
  
  {"play", "Earth2"},
  {"play", "Explosion1"},
  
  {"pauseExecution", 1},
  
  
  
  {"clear", "s01_p034_bg"},
  
  {"play", "Collapse2"},
  {"play", "Collapse1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p035_bg"},
  {"addText", "Z1", "AAAAAAAAAAaaaaaahh!!!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Scream"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p036_bg"},
  {"addText", "E1", "Huh!?", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E2", "What happened!?", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p037_bg"},
  {"addText", "Z1", "*Whimper*", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 1},
  {"addText", "E1", "*Sigh*", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p038_bg"},
  {"addText", "E1", "We SERIOUSLY don't have time for this!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Equip2"},
  {"play", "Wind1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p039_bg"}, 
  {"addText", "Z1", "Let me go!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p040_bg"},
  
  {"show", "s01_p040_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p041_bg"},
  {"addText", "E1", "End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"pauseExecution", 0.5},
  {"addText", "E2", "STOP IT!!", {pos = {x = 0, y = 300}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p042_bg"},
  
  {"play", "Slash2"},
  {"play", "Absorb1"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p043_bg"},
  {"addText", "E1", "OW! What the hell!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p044_bg"},
  {"addText", "E1", "I dont want to go anymore, End! Lets go back!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p045_bg"},
  {"addText", "E1", "Cant do that, Zero!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p046_bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p047_bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p048_bg"},
  {"addText", "E1", "Hmph!", {pos = {x = 0, y = 1080 - 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p049_bg"},
  
  {"show", "s01_p049_s1"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p050_bg"},
  {"addText", "E1", "It hurts people when you hit them, End!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p051_bg"},
  {"addText", "E1", "I know!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p052_bg"},
  {"addText", "Z1", "I don't want you to fight anymore!!", {pos = {x = 0, y = 200}, color = {000, 000, 000}, width = 1920, align = "center"} },
  {"play", "Bam"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p053_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p054_bg"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p055_bg"},
  {"play", "Bam"},
  {"addText", "E1", "You honestly expect us to be able to walk out of here if we ask nicely enough!?", {pos = {x = 1920 - 700, y = 200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "E2", "Dont be an idiot! This is the only way", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p056_bg"},
  {"addText", "E1", "There is a lot of bullshit going on here, so I don't expect you to understand everything.", {pos = {x = 1920 - 650, y = 200}, color = {000, 000, 000}, width = 620} },
  {"waitForInput"},
  {"addText", "E2", "But the least you could do is keep up and stop acting like a baby.", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p057_bg"},
  
  {"waitForInput"},
  
  
  
  {"clear", "s01_p058_bg"},
  {"addText", "Z1", "*Sob, sob*", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p059_bg"},
  {"addText", "Z1", "*CRYING!*", {pos = {x = 700, y = 1080-200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p060_bg"},
  {"addText", "Z1", "You are stupid,End!", {pos = {x = 1920 - 650, y = 400}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "Z2", "You are a fake...", {pos = {x = 1920 - 550, y = 500}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  {"addText", "Z3", "...not real!", {pos = {x = 1920 - 400, y = 600}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p061_bg"},
  {"addText", "E1", "The hell...?", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p062_bg"},
  {"play", "Damage2"},
  {"play", "Damage3"},
  {"play", "Earth2"},
  {"waitForInput"},
  
  
  
  {"clear", "s01_p063_bg"},
  {"addText", "Z1", "Ow!", {pos = {x = 1920 - 1000, y = 500}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p064_bg"},
  {"addText", "E1", "Get back here!", {pos = {x = 1920 - 800, y = 300}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p065_bg"},
  {"addText", "E1", "Zero!", {pos = {x = 300, y = 200}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  
  {"clear", "s01_p066_bg"},
  {"addText", "Z1", "For fuck's sake...", {pos = {x = 1920 - 550, y = 450}, color = {000, 000, 000}, width = 500} },
  {"waitForInput"},
  
  
  {"gotoBattle", stateBattle},
  
  
  {"clear", "endMarker"},
}