local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)
local types = require(script.Parent.types)

type InventoryProducer = Reflex.Producer<InventoryState, InventoryActions>

export type InventoryState = {
	[string]: types.PlayerInventory,
}

export type InventoryActions = {
	loadPlayerData: (playerId: string, data: types.PlayerData) -> (),
	closePlayerData: (playerId: string) -> (),
	addPet: (playerId: string, petId: string) -> (),
	removePet: (playerId: string, petId: string) -> (),
	togglePetEquipped: (playerId: string, petId: string) -> (),
}

local initialState: InventoryState = {}

local inventorySlice: InventoryProducer = Reflex.createProducer(initialState, {
	loadPlayerData = function(state, id: string, data: types.PlayerData)
		return Sift.Dictionary.set(state, id, data.inventory)
	end,

	closePlayerData = function(state, id: string)
		return Sift.Dictionary.removeKey(state, id)
	end,

	addPet = function(state, id: string, petId: string)
		return Sift.Dictionary.update(state, id, function(inventory: types.PlayerInventory)
			return Sift.Dictionary.set(
				inventory,
				"pets",
				Sift.Dictionary.set(inventory.pets, petId, { equipped = false })
			)
		end)
	end,

	removePet = function(state, id: string, petId: string)
		return Sift.Dictionary.update(state, id, function(inventory: types.PlayerInventory)
			return Sift.Dictionary.set(inventory, "pets", Sift.Dictionary.removeKey(inventory.pets, petId))
		end)
	end,

	togglePetEquipped = function(state, id: string, petId: string)
		return Sift.Dictionary.update(state, id, function(inventory: types.PlayerInventory)
			return Sift.Dictionary.set(
				inventory,
				"pets",
				Sift.Dictionary.update(inventory.pets, petId, function(pet: types.PlayerInventoryPet)
					return Sift.Dictionary.set(pet, "equipped", not pet.equipped)
				end)
			)
		end)
	end,
})

return {
	inventorySlice = inventorySlice,
}
