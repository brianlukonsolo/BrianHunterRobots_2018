-----------------------------------------------------------------------------------------
--
-- Behaviours.lua -> holds all the functions necessary for robot movement and behaviour
--imports
local properties = require('Configuration.Properties')
-----------------------------------------------------------------------------------------

local robotFunctions = {}

function robotFunctions.pickNewCoordinates(obj)
	obj.nextDestinationX = math.random(-50,50)
	obj.nextDestinationY = math.random(-50,50)

end

function robotFunctions.killTransition(obj)
	if obj.transition and killall == true then
		transition.cancel(obj.transition)
		obj.transition = nil
	end

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
	obj.transition = transition.to(obj, {x = x or obj.nextDestinationX, y = y or obj.nextDestinationY, delta = true})

end

function robotFunctions.explore(obj)
	pickNewCoordinates(obj)
	timer.performWithDelay(math.random(10,5000), move(obj))

end

return robotFunctions