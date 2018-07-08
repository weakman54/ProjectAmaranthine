
DEFAULT_FRAMERATE = 12

W, H = 1920, 1080 -- pixels


PARRY_TRESHOLD     = 0.3 -- amount of time that you can dodge / more time = more easy 
PERFDODGE_TRESHOLD = 0.2
NORMDODGE_TRESHOLD = 0.4


PARRY0_DURATION = 1.0     -- duration, the entire duration until the attack happens (windup duration)
--PARRY0_TARGET   = 0.6   -- target, the optimal time to hit the attack button -- NOTE: TARGET WILL ALWAYS BE HALF OF DURATION ATM!!

PARRY1_DURATION = 0.7    
--PARRY1_TARGET   = 0.6 

PARRY2_DURATION = 0.7
--PARRY2_TARGET   = 0.6

PARRY3_DURATION = 1.3
--PARRY3_TARGET   = 0.9


-- Damage and stuff -- points (HP/SP)
INTENSE_DAMAGE_TRESHOLD = 5  -- This is currently set so that intense hurt is never triggered, please notify erik if changed!


PLAYER_NORMAL_DAMAGE = 2
PLAYER_CHARGE_ATTACK_DAMAGE = 3
PLAYER_DODGE_DAMAGE = 1

-- damageDealt = BASE + GRAD - GRAD * hitMultiplier (goes from 0 -> 1 -> 0, where 1 is perfect hit)
PLAYER_PARRY_DAMAGE_BASE = 0.5 -- Will always do this much damage
PLAYER_PARRY_DAMAGE_GRAD = 2.5 -- Does up to this much additional damage depending on how well you hit target


ENEMY_ATTACK_HIGH_DAMAGE = 2
ENEMY_ATTACK_LOW_DAMAGE  = 2
ENEMY_ATTACK_COUNTER_DAMAGE = 2


PARRY_SP_COST = 0.95
MIN_SP_TO_PARRY = PARRY_SP_COST

SP_GAIN_FROM_DODGE_NORMAL = 0.5 -- is broken EKIVI -- NOTE FIXED?
SP_GAIN_FROM_DODGE_PERFECT = 1.0 -- is broken too EKIVI FIXED?

-- Enemy attack weights, these function like if you put this many in a hat and then draw one
-- So 2, 2, 1 means put two notes with HIGH, 2 with LOW and one with TAUNT, whatever we get when we pull is what happens
-- Since the total number of notes is 5, the pobabilities for the above example would be:
--   HIGH & LOW: 2/5
--   TAUNT     : 1/5
ENEMY_ATTACK_HIGH_WEIGHT = 4.05
ENEMY_ATTACK_LOW_WEIGHT  = 4
ENEMY_TAUNT_WEIGHT       = 1.5
-- REMEMBER TO TEST A BUNCH OF TIMES WHEN MESSING WITH PROBABILITIES, you might just have gotten an improbable streak of choices


DMG_TO_SP_RATIO = 0.0 -- muliplier: spGained = damageDone * DMG_TO_SP_RATIO



FONT_PATH = "assets/fonts/typewcond_bold.otf"
FONT_SIZE = 48



GUI_TIME_FOR_INPUT = 1 -- seconds until gui element is triggered when button is held


