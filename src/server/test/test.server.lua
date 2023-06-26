--!nocheck
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local TestEZ = require(ReplicatedStorage.Packages.TestEZ)

TestEZ.TestBootstrap:run(
	{ ReplicatedStorage.Shared.test, ServerScriptService.Server.test },
	TestEZ.Reporters.TextReporter,
	{}
)
