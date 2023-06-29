local ReplicatedStorage = game:GetService("ReplicatedStorage")

local slices = require(ReplicatedStorage.Shared.slices)

local function selectCount(state: slices.SharedState)
	return state.counter.count
end

return {
	selectCount = selectCount,
}
