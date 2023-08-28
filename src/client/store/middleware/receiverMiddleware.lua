local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Net = require(ReplicatedStorage.Packages.Net)
local remotes = require(ReplicatedStorage.Shared.remotes)

local function receiverMiddleware()
	local start = remotes.Client:Get("start") :: Net.ClientSenderEvent
	local broadcast = remotes.Client:Get("broadcast") :: Net.ClientListenerEvent

	local receiver = Reflex.createBroadcastReceiver({
		start = function(): ()
			start:SendToServer()
		end,
	})

	broadcast:Connect(function(actions)
		receiver:dispatch(actions)
	end)

	return receiver.middleware
end

return receiverMiddleware
