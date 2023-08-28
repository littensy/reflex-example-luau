local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Net = require(ReplicatedStorage.Packages.Net)
local remotes = require(ReplicatedStorage.Shared.remotes)
local slices = require(ReplicatedStorage.Shared.slices)

local function broadcasterMiddleware()
	local broadcast = remotes.Server:Get("broadcast") :: Net.ServerSenderEvent
	local start = remotes.Server:Get("start") :: Net.ServerListenerEvent

	local broadcaster = Reflex.createBroadcaster({
		producers = slices,
		dispatch = function(player, actions)
			broadcast:SendToPlayer(player, actions)
		end,
	})

	start:Connect(function(player)
		return broadcaster:start(player)
	end)

	return broadcaster.middleware
end

return broadcasterMiddleware
