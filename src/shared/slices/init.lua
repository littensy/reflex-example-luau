local players = require(script.players)
local counter = require(script.counter)

export type SharedState = {
	players: players.PlayersState,
	counter: counter.CounterState,
}

export type SharedActions = players.PlayersActions & counter.CounterActions

return {
	players = players.playersSlice,
	counter = counter.counterSlice,
}
