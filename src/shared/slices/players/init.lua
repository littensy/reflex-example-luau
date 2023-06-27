local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local balance = require(script.balance)
local inventory = require(script.inventory)
local types = require(script.types)
local utils = require(script.utils)

export type PlayerData = types.PlayerData
export type PlayerBalance = types.PlayerBalance
export type PlayerInventory = types.PlayerInventory

type PlayersProducer = Reflex.Producer<PlayersState, PlayersActions>

export type PlayersState = {
	balance: balance.BalanceState,
	inventory: inventory.InventoryState,
}

export type PlayersActions = balance.BalanceActions & inventory.InventoryActions

local playersSlice: PlayersProducer = Reflex.combineProducers({
	balance = balance.balanceSlice,
	inventory = inventory.inventorySlice,
})

return {
	playersSlice = playersSlice,
	template = utils.template,
}
