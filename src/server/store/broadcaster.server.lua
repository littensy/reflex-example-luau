local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Net = require(ReplicatedStorage.Packages.Net)
local remotes = require(ReplicatedStorage.Shared.remotes)
local slices = require(ReplicatedStorage.Shared.slices)
local store = require(script.Parent)

local broadcast = remotes.Server:Get("broadcast") :: Net.ServerSenderEvent

local broadcaster = Reflex.createBroadcaster({
	producers = slices,
	broadcast = function(players, actions)
		broadcast:SendToPlayers(players, actions)
	end,
})

remotes.Server:OnFunction("requestState", function(player)
	return broadcaster:playerRequestedState(player)
end)

store:applyMiddleware(broadcaster.middleware)
