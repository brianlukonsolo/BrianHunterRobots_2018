-----------------------------------------------------------------------------------------
--
-- main.lua -> the most important file that runs the whole app
--imports
local robotFunctions = require('RobotFunctions.Behaviours')
local props = require('Configuration.Properties')
--globals
local killall = false
-----------------------------------------------------------------------------------------

local bg = display.newRect(props.ZERO, props.ZERO, display.contentWidth, display.contentHeight)
bg.x = display.contentWidth/2
bg.y = display.contentHeight/2
bg:setFillColor(props.ZERO, props.ZERO, 0.2)

--Robot clones factory
local spawnTable = {}

local function spawnHunterRobot()
	local hunterRobot = display.newCircle(props.BOT_SIZE, props.BOT_SIZE, props.BOT_SIZE)
	hunterRobot.name = props.DEFAULT_BOT_NAME
	hunterRobot.bias = math.random(props.BIAS_MIN, props.BIAS_MAX)
	hunterRobot.x = math.random(props.MAX_DISTANCE_LEFT, props.MAX_DISTANCE_RIGHT)
	hunterRobot.y = math.random(props.MAX_DISTANCE_UP, props.MAX_DISTANCE_DOWN)
	hunterRobot.nextDestinationX = math.random(props.BOT_DESTINATION_MIN, props.BOT_DESTINATION_MAX)
	hunterRobot.nextDestinationY = math.random(props.BOT_DESTINATION_MIN, props.BOT_DESTINATION_MAX)
	hunterRobot:setFillColor(0.8, props.ZERO, props.ZERO)

	return hunterRobot

end

--Spawning the bots
for i=1, props.NUMBER_OF_BOTS_TO_SPAWN do
 spawnTable[i] = spawnHunterRobot()
 spawnTable[i].name = 'Bot' .. tostring(math.random(props.ZERO, props.MAX_BOT_POPULATION))
end

function allBotsExplore()
	for c=1, #spawnTable do
		robotFunctions.pickNewCoordinates(spawnTable[c])
		timer.performWithDelay(math.random(props.SINGLE_BOT_TIMER_MIN, 
		props.SINGLE_BOT_TIMER_MAX), robotFunctions.move(spawnTable[c]))
	end

end

--bots explore forever with interval
local timedEvent = timer.performWithDelay(
	math.random(props.TIMER_MINIMUM, props.TIMER_MAXIMUM), allBotsExplore, props.ZERO)


--End of program-------------------------------------------------------------------------
--Make sure transitions stop and objects are deleted
local function cleanUpScene()
	timedEvent = nil
	--delete all spawned bots
	for k,v in pairs(spawnTable) do
		k = nil
		v = nil
	end
	--destroy the spawn table
	spawnTable = nil

end

if killall then
	cleanUpScene()
end