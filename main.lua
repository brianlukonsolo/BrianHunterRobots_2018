-----------------------------------------------------------------------------------------
--
-- main.lua -> the most important file that runs the whole app
--imports
local robotFunctions = require('RobotFunctions.Behaviours')
local properties = require('Configuration.Properties')
--globals
local killall = false
-----------------------------------------------------------------------------------------

local bg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
bg.x = display.contentWidth/2
bg.y = display.contentHeight/2
bg:setFillColor(0,0,0.2)

--Robot clones factory
local spawnTable = {}

local function spawnHunterRobot()
	local hunterRobot = display.newCircle(properties.BOT_SIZE, properties.BOT_SIZE, properties.BOT_SIZE)
	hunterRobot.name = properties.DEFAULT_BOT_NAME
	hunterRobot.x = math.random(properties.MAX_DISTANCE_LEFT, properties.MAX_DISTANCE_RIGHT)
	hunterRobot.y = math.random(properties.MAX_DISTANCE_UP, properties.MAX_DISTANCE_DOWN)
	hunterRobot.nextDestinationX = math.random(-10,10) + math.random(-10,10)
	hunterRobot.nextDestinationY = math.random(-10,10) +math.random(-10,10)
	hunterRobot:setFillColor(0.8,0,0)

	return hunterRobot

end

--Spawning the bots
for i=1, properties.NUMBER_OF_BOTS_TO_SPAWN do
 spawnTable[i] = spawnHunterRobot()
 spawnTable[i].name = 'Bot' .. tostring(math.random(0, properties.MAX_BOT_POPULATION))
end

function allBotsExplore()
	for c=1, #spawnTable do
		robotFunctions.pickNewCoordinates(spawnTable[c])
		timer.performWithDelay(math.random(10,5000), robotFunctions.move(spawnTable[c]))
	end

end

--bots explore forever with interval
local timedEvent = timer.performWithDelay(
	math.random(properties.TIMER_MINIMUM, properties.TIMER_MAXIMUM), allBotsExplore, 0)


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