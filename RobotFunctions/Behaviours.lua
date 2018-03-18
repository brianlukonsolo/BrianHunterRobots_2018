-----------------------------------------------------------------------------------------
--
-- Behaviours.lua -> holds all the functions necessary for robot movement and behaviour
--imports
local properties = require('Configuration.Properties')
-----------------------------------------------------------------------------------------

local robotFunctions = {}

function robotFunctions.pickNewCoordinates(obj)
	local object = obj
	object.nextDestinationX = math.random(properties.BOT_DESTINATION_MIN,
	 properties.BOT_DESTINATION_MAX)
	object.nextDestinationY = math.random(properties.BOT_DESTINATION_MIN,
	 properties.BOT_DESTINATION_MAX)

	return object

end

function robotFunctions.move(obj)
	if obj.x > properties.MAX_DISTANCE_RIGHT then
		obj.x = properties.MAX_DISTANCE_RIGHT
	end

	if obj.x < properties.MAX_DISTANCE_LEFT then
		obj.x = properties.MAX_DISTANCE_LEFT
	end

	if obj.y < properties.MAX_DISTANCE_UP then
		obj.y = properties.MAX_DISTANCE_UP
	end

	if obj.y > properties.MAX_DISTANCE_DOWN then
		obj.y = properties.MAX_DISTANCE_DOWN
	end
	--If robot is within the display area limits
	obj.transition = transition.to(obj, {x = x or obj.nextDestinationX, 
		y = y or obj.nextDestinationY, delta = true})

end

function robotFunctions.allBotsDecideDestination(spawnTableOfRobots)
	for i=1, #spawnTableOfRobots do
		spawnTableOfRobots[i] = robotFunctions.pickNewCoordinates(spawnTableOfRobots[i])
	end

end

function robotFunctions.killTransition(obj)
	if obj.transition and killall == true then
		transition.cancel(obj.transition)
		obj.transition = nil
	end

end

function robotFunctions.explore(obj)
	robotFunctions.pickNewCoordinates(obj)
	timer.performWithDelay(math.random(properties.SINGLE_BOT_TIMER_MIN, 
		properties.SINGLE_BOT_TIMER_MAX), robotFunctions.move(obj))

end

return robotFunctions