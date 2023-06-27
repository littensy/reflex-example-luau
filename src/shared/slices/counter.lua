local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)

type CounterProducer = Reflex.Producer<CounterState, CounterActions>

export type CounterState = {
	count: number,
}

export type CounterActions = {
	increment: () -> (),
	decrement: () -> (),
}

local initialState: CounterState = {
	count = 0,
}

local counterSlice: CounterProducer = Reflex.createProducer(initialState, {
	increment = function(state)
		return Sift.Dictionary.set(state, "count", state.count + 1)
	end,

	decrement = function(state)
		return Sift.Dictionary.set(state, "count", state.count - 1)
	end,
})

return {
	counterSlice = counterSlice,
}
