local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Reflex = require(ReplicatedStorage.Packages.Reflex)
local Net = require(ReplicatedStorage.Packages.Net)
local remotes = require(ReplicatedStorage.Shared.remotes)
local store = require(script.Parent)

local requestState = remotes.Client:Get("requestState") :: Net.ClientAsyncCaller

local receiver = Reflex.createBroadcastReceiver({
	requestState = function()
		return requestState:CallServerAsync()
	end,
})

remotes.Client:OnEvent("broadcast", function(actions)
	receiver:dispatch(actions :: { Reflex.BroadcastAction })
end)

store:applyMiddleware(receiver.middleware)
