local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Sift = require(ReplicatedStorage.Packages.Sift)
local players = require(script.players)
local counter = require(script.counter)

return Sift.Dictionary.merge(players, counter) :: typeof(players) & typeof(counter)
