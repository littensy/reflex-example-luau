return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ServerScriptService = game:GetService("ServerScriptService")

	local template = require(ServerScriptService.Server.data.template)
	local balance = require(ReplicatedStorage.Shared.slices.players.balance)

	beforeEach(function()
		balance.loadPlayerData("__temp", template)
	end)

	afterEach(function()
		balance.closePlayerData("__temp")
	end)

	it("should load default data", function()
		local data = balance:getState(function(state)
			return state.__temp
		end)

		expect(data).to.be.a("table")
		expect(data.coins).to.equal(template.balance.coins)
		expect(data.gems).to.equal(template.balance.gems)
	end)

	it("should update the balance", function()
		balance.updateBalance("__temp", "coins", 100)

		local data = balance:getState(function(state)
			return state.__temp
		end)

		expect(data).to.be.a("table")
		expect(data.coins).to.equal(template.balance.coins + 100)
		expect(data.gems).to.equal(template.balance.gems)
	end)
end
