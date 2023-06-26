return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local players = require(ReplicatedStorage.Shared.slices.players)

	beforeEach(function()
		players.inventory.loadPlayerData("__temp", players.template)
	end)

	afterEach(function()
		players.inventory.closePlayerData("__temp")
	end)

	local function selectInventory(state: players.InventoryState)
		return state.__temp
	end

	it("should load default data", function()
		local inventory = players.inventory:getState(selectInventory)
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
	end)

	it("should add a pet", function()
		players.inventory.addPet("__temp", "pet")

		local inventory = players.inventory:getState(selectInventory)
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
		expect(inventory.pets.pet).to.be.a("table")
	end)

	it("should remove a pet", function()
		players.inventory.addPet("__temp", "pet")
		local inventory = players.inventory:getState(selectInventory)
		expect(inventory.pets.pet).to.be.a("table")

		players.inventory.removePet("__temp", "pet")
		inventory = players.inventory:getState(selectInventory)
		expect(inventory.pets.pet).to.equal(nil)
	end)

	it("should toggle a pet's equipped state", function()
		players.inventory.addPet("__temp", "pet")
		players.inventory.togglePetEquipped("__temp", "pet")

		local inventory = players.inventory:getState(selectInventory)
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
		expect(inventory.pets.pet).to.be.a("table")
		expect(inventory.pets.pet.equipped).to.equal(true)
	end)
end
