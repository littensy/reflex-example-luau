local types = require(script.Parent.types)

local template: types.PlayerData = {
	balance = {
		coins = 0,
		gems = 0,
	},
	inventory = {
		pets = {},
	},
}

return {
	template = template,
}
