-----------------------------------------------------------------------------------------
--
-- Properties.lua -> holds all necessary configuration values and settings
--
-----------------------------------------------------------------------------------------
local properties = {}

--Screen Limits
properties.MAX_DISTANCE_RIGHT = 300
properties.MAX_DISTANCE_LEFT = 0
properties.MAX_DISTANCE_UP = 0
properties.MAX_DISTANCE_DOWN = 500

--Max population of bots
properties.MAX_BOT_POPULATION = 1000
properties.NUMBER_OF_BOTS_TO_SPAWN = 20
properties.BOT_SIZE = 10

--Timers
properties.TIMER_MINIMUM = 0
properties.TIMER_MAXIMUM = 1000

--Strings
properties.DEFAULT_BOT_NAME = 'DefaultBrianClone'

return properties