-----------------------------------------------------------------------------------------
--
-- HunterRobotFactory.lua -> responsible for the creation of hunter robots
--imports
local properties = require('Configuration.Properties')
-----------------------------------------------------------------------------------------

local hunterRobotFactory = {}

local function createHunterRobot()
	local hunterRobot = display.newCircle(properties.BOT_SIZE, properties.BOT_SIZE, properties.BOT_SIZE)
	hunterRobot.name = properties.DEFAULT_BOT_NAME
	hunterRobot.bias = math.random(properties.BIAS_MIN, properties.BIAS_MAX)
	hunterRobot.x = math.random(properties.MAX_DISTANCE_LEFT, properties.MAX_DISTANCE_RIGHT)
	hunterRobot.y = math.random(properties.MAX_DISTANCE_UP, properties.MAX_DISTANCE_DOWN)
	hunterRobot.nextDestinationX = math.random(properties.BOT_DESTINATION_MIN, 
		properties.BOT_DESTINATION_MAX)
	hunterRobot.nextDestinationY = math.random(properties.BOT_DESTINATION_MIN, 
		properties.BOT_DESTINATION_MAX)
	hunterRobot:setFillColor(0.8, properties.ZERO, properties.ZERO)

	return hunterRobot

end

function hunterRobotFactory.createHunterRobots(numberOfBotsToCreate)
	local spawnTable = {}
	for i=1, numberOfBotsToCreate do
 		spawnTable[i] = createHunterRobot()
 		spawnTable[i].name = 'Bot' .. tostring(math.random(properties.ZERO, 
 			properties.MAX_BOT_POPULATION))
	end

	return spawnTable

end

return hunterRobotFactory