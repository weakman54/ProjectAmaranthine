
DEFAULT_FRAMERATE = 12

W, H = 1920, 1080 -- pixels


PARRY_TRESHOLD     = 0.2 -- amount of time that you can dodge / more time = more easy 
PERFDODGE_TRESHOLD = 0.2
NORMDODGE_TRESHOLD = 0.4


PARRY0_DURATION = 0.7     -- duration, the entire duration until the attack happens (windup duration)
--PARRY0_TARGET   = 0.6   -- target, the optimal time to hit the attack button -- NOTE: TARGET WILL ALWAYS BE HALF OF DURATION ATM!!

PARRY1_DURATION = 0.7    
--PARRY1_TARGET   = 0.6 

PARRY2_DURATION = 0.7
--PARRY2_TARGET   = 0.6

PARRY3_DURATION = 1.0
--PARRY3_TARGET   = 0.9


-- Damage and stuff -- points (HP/SP)
INTENSE_DAMAGE_TRESHOLD = 5  


PLAYER_NORMAL_DAMAGE = 1
PLAYER_CHARGE_ATTACK_DAMAGE = 3
PLAYER_DODGE_DAMAGE = 1

-- damageDealt = BASE + GRAD - GRAD * hitMultiplier (goes from 0 -> 1 -> 0, where 1 is perfect hit)
PLAYER_PARRY_DAMAGE_BASE = 1 -- Will always do this much damage
PLAYER_PARRY_DAMAGE_GRAD = 2 -- Does up to this much additional damage depending on how well you hit target


ENEMY_ATTACK_HIGH_DAMAGE = 1
ENEMY_ATTACK_LOW_DAMAGE  = 4
ENEMY_ATTACK_COUNTER_DAMAGE = 3



-- Enemy attack weights, these function like if you put this many in a hat and then draw one
-- So 2, 2, 1 means put two notes with HIGH, 2 with LOW and one with TAUNT, whatever we get when we pull is what happens
-- Since the total number of notes is 5, the pobabilities for the above example would be:
--   HIGH & LOW: 2/5
--   TAUNT     : 1/5
ENEMY_ATTACK_HIGH_WEIGHT = 2
ENEMY_ATTACK_LOW_WEIGHT  = 2
ENEMY_TAUNT_WEIGHT       = 1
-- REMEMBER TO TEST A BUNCH OF TIMES WHEN MESSING WITH PROBABILITIES, you might just have gotten an improbable streak of choices


DMG_TO_SP_RATIO = 0.1 -- muliplier: spGained = damageDone * DMG_TO_SP_RATIO



FONT_PATH = "assets/fonts/typewcond_bold.otf"
FONT_SIZE = 48


