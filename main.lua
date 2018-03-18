-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local killall = false
local MAX_DISTANCE_RIGHT = 300
local MAX_DISTANCE_LEFT = 10
local MAX_DISTANCE_UP = 10
local MAX_DISTANCE_DOWN = 300

local bg = display.newRect(0, 0, display.contentWidth, display.contentHeight)
bg:setFillColor(0,1,0)

--================================= Robot Clones factory =======================================]]
--Create the functions
	function pickNewCoordinates(self)
		self.nextDestinationX = math.random(-50,50)
		self.nextDestinationY = math.random(-50,50)
	end

	function killTransition(self)
		if self.transition and killall == true then
			transition.cancel(self.transition)
			self.transition = nil
		end
	end

	function move(self)
		print(self.x)
		if self.x > MAX_DISTANCE_RIGHT then
			self.x = MAX_DISTANCE_RIGHT
		end

		if self.x < MAX_DISTANCE_LEFT then
			self.x = MAX_DISTANCE_LEFT
		end

		if self.y < MAX_DISTANCE_UP then
			self.y = MAX_DISTANCE_UP
		end

		if self.y > MAX_DISTANCE_DOWN then
			self.y = MAX_DISTANCE_DOWN
		end

		--If robot is within limits
			self.transition = transition.to(self, {x = self.nextDestinationX, y = self.nextDestinationY, delta = true})

	end

--Create the clones

local spawnTable = {}

local function spawnHunterRobot()
	local hunterRobot = display.newCircle(20,20,20)
	hunterRobot.name = 'Clone ' .. tostring(math.random(0,1000))
	hunterRobot.x = math.random(MAX_DISTANCE_LEFT, MAX_DISTANCE_RIGHT)
	hunterRobot.y = math.random(MAX_DISTANCE_UP, MAX_DISTANCE_DOWN)
	hunterRobot.nextDestinationX = math.random(-10,10)
	hunterRobot.nextDestinationY = math.random(-10,50)
	hunterRobot:setFillColor(0.8,0,0)

	return hunterRobot

end
--========================================================================================]]

for i=1,5 do
 spawnTable[i] = spawnHunterRobot()
end

function allBotsExplore()
	for c=1, #spawnTable do
		pickNewCoordinates(spawnTable[c])
		timer.performWithDelay(math.random(10,5000), move(spawnTable[c]))
	end
end

timer.performWithDelay(math.random(0,2000), allBotsExplore, 0)

--Make sure transitions die
killall = true