local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local slices = require(ReplicatedStorage.Shared.slices)
local players = require(ReplicatedStorage.Shared.slices.players)

local function selectPlayerBalance(playerId: string)
	return function(state: slices.SharedState)
		return state.players.balance[playerId]
	end
end

local function selectPlayerInventory(playerId: string)
	return function(state: slices.SharedState)
		return state.players.inventory[playerId]
	end
end

local function selectPlayerData(playerId: string)
	return Reflex.createSelector(
		selectPlayerBalance(playerId),
		selectPlayerInventory(playerId),
		function(balance: players.PlayerBalance?, inventory: players.PlayerInventory?): players.PlayerData?
			if not balance or not inventory then
				return
			end

			return {
				balance = balance,
				inventory = inventory,
			}
		end
	)
end

return {
	selectPlayerBalance = selectPlayerBalance,
	selectPlayerInventory = selectPlayerInventory,
	selectPlayerData = selectPlayerData,
}
