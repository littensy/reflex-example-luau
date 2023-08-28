local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)
local slices = require(ReplicatedStorage.Shared.slices)
local broadcasterMiddleware = require(script.middleware.broadcasterMiddleware)

export type RootProducer = Reflex.Producer<RootState, RootActions>
export type RootState = slices.SharedState & {}
export type RootActions = slices.SharedActions & {}

local store: RootProducer = Reflex.combineProducers(Sift.Dictionary.merge(slices, {
	-- Add server-specific slices here
}))

store:applyMiddleware(broadcasterMiddleware(), Reflex.loggerMiddleware)

return store
