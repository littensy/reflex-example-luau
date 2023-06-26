local ReplicatedStorage = game:GetService("ReplicatedStorage")

local players = require(ReplicatedStorage.Shared.slices.players)

local template: players.PlayerData = {
	balance = {
		coins = 100,
		gems = 0,
	},
	inventory = {
		pets = {},
	},
}

return template
