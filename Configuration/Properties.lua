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

--Bot attributes
properties.MAX_BOT_POPULATION = 1000
properties.NUMBER_OF_BOTS_TO_SPAWN = 50
properties.BOT_SIZE = 10
properties.BOT_DESTINATION_MIN = -50
properties.BOT_DESTINATION_MAX = 50
properties.BIAS_MIN = 0
properties.BIAS_MAX = 20

--Timers
properties.TIMER_MINIMUM = 0
properties.TIMER_MAXIMUM = 1000
properties.SINGLE_BOT_TIMER_MIN = 0
properties.SINGLE_BOT_TIMER_MAX = 500

--Strings and numbers
properties.DEFAULT_BOT_NAME = 'DefaultBrianClone'
properties.ZERO = 0

return properties