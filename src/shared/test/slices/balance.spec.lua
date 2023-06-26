return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local players = require(ReplicatedStorage.Shared.slices.players)

	beforeEach(function()
		players.balance.loadPlayerData("__temp", players.template)
	end)

	afterEach(function()
		players.balance.closePlayerData("__temp")
	end)

	local function selectBalance(state: players.BalanceState)
		return state.__temp
	end

	it("should load default data", function()
		local balance = players.balance:getState(selectBalance)
		expect(balance).to.be.a("table")
		expect(balance.coins).to.equal(players.template.balance.coins)
		expect(balance.gems).to.equal(players.template.balance.gems)
	end)

	it("should update the balance", function()
		players.balance.updateBalance("__temp", "coins", 100)
		local balance = players.balance:getState(selectBalance)
		expect(balance).to.be.a("table")
		expect(balance.coins).to.equal(players.template.balance.coins + 100)
		expect(balance.gems).to.equal(players.template.balance.gems)
	end)
end
