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

--Recieve new bots table from factory
local spawnTable = robotFactory.createHunterRobots(props.NUMBER_OF_BOTS_TO_SPAWN)

--bots explore forever with interval
local allBotTimer = timer.performWithDelay(
	math.random(props.ZERO, props.SINGLE_BOT_TIMER_MAX), function()
	local botTimer
	if killall == false then
		for i=1, #spawnTable do
			 botTimer= timer.performWithDelay( math.random(props.ZERO,
			 props.SINGLE_BOT_TIMER_MAX),

			 robotFunctions.explore(spawnTable[i]))
		end
	else
		botTimer = nil
	end
end, props.ZERO)



--End of program-------------------------------------------------------------------------
--Make sure transitions stop and objects are deleted
local function cleanUpScene()
	--delete all spawned bots
	for k,v in pairs(spawnTable) do
		k = nil
		v = nil
	end
	--destroy the spawn table
	spawnTable = nil
	--kill the timer
	allBotTimer = nil

end

if killall then
	cleanUpScene()
end