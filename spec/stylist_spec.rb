require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("is cleared each time, should be empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end
