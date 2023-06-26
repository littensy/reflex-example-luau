local players = require(script.players)

export type SharedState = {
	balance: players.BalanceState,
	inventory: players.InventoryState,
}

export type SharedActions = players.BalanceActions & players.InventoryActions

return {
	balance = players.balance,
	inventory = players.inventory,
}
