--!nocheck
local Client = script:FindFirstAncestor("Client")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.Packages.TestEZ)

TestEZ.TestBootstrap:run({ ReplicatedStorage.Shared.test, Client.test }, TestEZ.Reporters.TextReporter, {})
