function HandleBatteries(container, powerpercentage, getnumber)
--percentage from 0 to 1 to set battery charge
local capacity = 0
local ISADIYBatteryCapacity = SandboxVars.ISA.DIYBatteryCapacity
	if SandboxVars.ISA.DIYBatteryCapacity == nil then
		ISADIYBatteryCapacity = 200
	end
for i=1,container:getItems():size() do 
local item = container:getItems():get(i-1)
local cond = 1 - (item:getCondition()/100)
local condition = 1 - (cond*cond*cond*cond*cond*cond)
local type = item:getType()
			if type == "50AhBattery" and item:getCondition() > 0 then
			capacity = capacity + 50 * condition
			item:setUsedDelta(powerpercentage)
			end
			if type == "75AhBattery" and item:getCondition() > 0 then
			capacity = capacity + 75 * condition
			item:setUsedDelta(powerpercentage)
			end
			if type == "100AhBattery" and item:getCondition() > 0 then
			capacity = capacity + 100 * condition
			item:setUsedDelta(powerpercentage)
			end
			if type == "DeepCycleBattery" and item:getCondition() > 0 then
			capacity = capacity + 200 * condition
			item:setUsedDelta(powerpercentage)
			end
			if type == "SuperBattery" and item:getCondition() > 0 then
			capacity = capacity + 400 * condition
			item:setUsedDelta(powerpercentage)
			end
			if type == "DIYBattery" and item:getCondition() > 0 then
			capacity = capacity + ISADIYBatteryCapacity * condition
			item:setUsedDelta(powerpercentage)
			end
			
end
if getnumber == false then
return capacity
else
return container:getItems():size()
end
end

function DegradeBatteries(container)
local ISABatteryDegradeChance = SandboxVars.ISA.batteryDegradeChance
	if SandboxVars.ISA.batteryDegradeChance == nil then
		ISABatteryDegradeChance = 100
	end
if ZombRand(0, 99) < ISABatteryDegradeChance then

for i=1,container:getItems():size() do 
local item = container:getItems():get(i-1)
local type = item:getType()
			if type == "50AhBattery" then
			item:setCondition(item:getCondition() - ZombRand(1, 10))
			--breaks in 20 days
			end
			if type == "75AhBattery" then
			item:setCondition(item:getCondition() - ZombRand(1, 8))
			--breaks in 25 days
			end
			if type == "100AhBattery" then
			item:setCondition(item:getCondition() - ZombRand(2, 6))
			--breaks in 33 days 
			end
			if type == "DeepCycleBattery" then
				local chance = ZombRand(1, 33)
				if chance == 1 then
					item:setCondition(item:getCondition() - 1)
				end
			--breaks in 9+ years
			end
			if type == "SuperBattery" then
				local chance = ZombRand(1, 33)
				if chance == 1 then
					item:setCondition(item:getCondition() - 1)
				end
			--breaks in 9+ years
			end
			if type == "DIYBattery" then
				local chance = ZombRand(1, 8)
				if chance == 1 then
					item:setCondition(item:getCondition() - 1)
				end
			--breaks in 2 years
			end
end
end
end