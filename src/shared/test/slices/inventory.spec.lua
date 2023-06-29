return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local players = require(ReplicatedStorage.Shared.slices.players)
	local inventorySlice = require(ReplicatedStorage.Shared.slices.players.inventory).inventorySlice

	beforeEach(function()
		inventorySlice.loadPlayerData("__test__", players.template)
	end)

	afterEach(function()
		inventorySlice:resetState()
	end)

	local function getInventory()
		return inventorySlice:getState().__test__ :: players.PlayerInventory
	end

	it("should load default data", function()
		local inventory = getInventory()
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
	end)

	it("should add a pet", function()
		inventorySlice.addPet("__test__", "pet")
		local inventory = getInventory()
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
		expect(inventory.pets.pet).to.be.a("table")
	end)

	it("should remove a pet", function()
		inventorySlice.addPet("__test__", "pet")
		local inventory = getInventory()
		expect(inventory.pets.pet).to.be.a("table")

		inventorySlice.removePet("__test__", "pet")
		inventory = getInventory()
		expect(inventory.pets.pet).to.equal(nil)
	end)

	it("should toggle a pet's equipped state", function()
		inventorySlice.addPet("__test__", "pet")
		inventorySlice.togglePetEquipped("__test__", "pet")
		local inventory = getInventory()
		expect(inventory).to.be.a("table")
		expect(inventory.pets).to.be.a("table")
		expect(inventory.pets.pet).to.be.a("table")
		expect(inventory.pets.pet.equipped).to.equal(true)
	end)
end
