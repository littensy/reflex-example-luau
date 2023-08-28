local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)
local slices = require(ReplicatedStorage.Shared.slices)
local receiverMiddleware = require(script.middleware.receiverMiddleware)

export type RootProducer = Reflex.Producer<RootState, RootActions>
export type RootState = slices.SharedState & {}
export type RootActions = slices.SharedActions & {}

local store: RootProducer = Reflex.combineProducers(Sift.Dictionary.merge(slices, {
	-- Add client-specific slices here
}))

store:applyMiddleware(receiverMiddleware(), Reflex.loggerMiddleware)

return store
