local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)
local types = require(script.Parent.types)

type BalanceProducer = Reflex.Producer<BalanceState, BalanceActions>

export type BalanceState = {
	[string]: types.PlayerBalance,
}

export type BalanceActions = {
	loadPlayerData: (playerId: string, data: types.PlayerData) -> (),
	closePlayerData: (playerId: string) -> (),
	updateBalance: (playerId: string, balanceType: types.PlayerBalanceType, amount: number) -> (),
}

local initialState: BalanceState = {}

local balanceSlice: BalanceProducer = Reflex.createProducer(initialState, {
	loadPlayerData = function(state, id: string, data: types.PlayerData)
		return Sift.Dictionary.set(state, id, data.balance)
	end,

	closePlayerData = function(state, id: string)
		return Sift.Dictionary.removeKey(state, id)
	end,

	updateBalance = function(state, id: string, balanceType: types.PlayerBalanceType, amount: number)
		return Sift.Dictionary.update(state, id, function(balance: types.PlayerBalance)
			return Sift.Dictionary.set(balance, balanceType, balance[balanceType] + amount)
		end)
	end,
})

return {
	balanceSlice = balanceSlice,
}
