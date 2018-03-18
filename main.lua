-----------------------------------------------------------------------------------------
--
-- main.lua -> the most important file that runs the whole app
--imports
local robotFactory = require('RobotFactory.HunterRobotFactory')
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
local spawnTable = robotFactory.createHunterRobots(props.NUMBER_OF_BOTS_TO_SPAWN)

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