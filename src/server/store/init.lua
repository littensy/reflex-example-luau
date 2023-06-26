local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Sift = require(ReplicatedStorage.Packages.Sift)
local slices = require(ReplicatedStorage.Shared.slices)

export type RootProducer = Reflex.Producer<RootState, RootActions>

export type RootState = slices.SharedState & {}

export type RootActions = slices.SharedActions & {}

return Reflex.combineProducers(Sift.Dictionary.merge(slices, {}))
	:applyMiddleware(Reflex.loggerMiddleware) :: RootProducer
