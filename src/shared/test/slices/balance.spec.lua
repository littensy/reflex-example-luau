return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local players = require(ReplicatedStorage.Shared.slices.players)
	local balanceSlice = require(ReplicatedStorage.Shared.slices.players.balance).balanceSlice

	beforeEach(function()
		balanceSlice.loadPlayerData("__test__", players.template)
	end)

	afterEach(function()
		balanceSlice.closePlayerData("__test__")
	end)

	local function getBalance()
		return balanceSlice:getState().__test__
	end

	it("should load default data", function()
		local balance = getBalance()
		expect(balance).to.be.a("table")
		expect(balance.coins).to.equal(players.template.balance.coins)
		expect(balance.gems).to.equal(players.template.balance.gems)
	end)

	it("should update the balance", function()
		balanceSlice.updateBalance("__test__", "coins", 100)
		local balance = getBalance()
		expect(balance).to.be.a("table")
		expect(balance.coins).to.equal(players.template.balance.coins + 100)
		expect(balance.gems).to.equal(players.template.balance.gems)
	end)
end
