--!nocheck
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local t = require(ReplicatedStorage.Packages.t)

return t.interface({
	balance = t.interface({
		coins = t.number,
		gems = t.number,
	}),
	inventory = t.interface({
		pets = t.map(
			t.string,
			t.interface({
				equipped = t.boolean,
			})
		),
	}),
})
