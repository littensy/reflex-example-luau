return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ServerScriptService = game:GetService("ServerScriptService")

	local template = require(ServerScriptService.Server.data.template)
	local inventory = require(ReplicatedStorage.Shared.slices.players.inventory)

	beforeEach(function()
		inventory.loadPlayerData("__temp", template)
	end)

	afterEach(function()
		inventory.closePlayerData("__temp")
	end)

	local function selectInventory(state: inventory.InventoryState)
		return state.__temp
	end

	it("should load default data", function()
		local data = inventory:getState(selectInventory)
		expect(data).to.be.a("table")
		expect(data.pets).to.be.a("table")
	end)

	it("should add a pet", function()
		inventory.addPet("__temp", "pet")

		local data = inventory:getState(selectInventory)
		expect(data).to.be.a("table")
		expect(data.pets).to.be.a("table")
		expect(data.pets.pet).to.be.a("table")
	end)

	it("should remove a pet", function()
		inventory.addPet("__temp", "pet")
		local data = inventory:getState(selectInventory)
		expect(data.pets.pet).to.be.a("table")

		inventory.removePet("__temp", "pet")
		data = inventory:getState(selectInventory)
		expect(data.pets.pet).to.equal(nil)
	end)

	it("should toggle a pet's equipped state", function()
		inventory.addPet("__temp", "pet")
		inventory.togglePetEquipped("__temp", "pet")

		local data = inventory:getState(selectInventory)
		expect(data).to.be.a("table")
		expect(data.pets).to.be.a("table")
		expect(data.pets.pet).to.be.a("table")
		expect(data.pets.pet.equipped).to.equal(true)
	end)
end
