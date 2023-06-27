return function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local counter = require(ReplicatedStorage.Shared.slices.counter).counterSlice

	local function getCount()
		return counter:getState().count
	end

	afterEach(function()
		counter:resetState()
	end)

	it("should increment the count", function()
		local before = getCount()
		counter.increment()
		expect(getCount()).to.equal(before + 1)
	end)

	it("should decrement the count", function()
		local before = getCount()
		counter.decrement()
		expect(getCount()).to.equal(before - 1)
	end)
end
