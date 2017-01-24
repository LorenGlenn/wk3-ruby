require('spec_helper')

describe(Client) do
  describe(".all") do
    it("cleared each time, no clients") do
      expect(Client.all()).to(eq([]))
    end
  end
