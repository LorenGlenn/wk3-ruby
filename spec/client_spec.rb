require('spec_helper')

describe(Client) do
  describe(".all") do
    it("cleared each time, no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
  it("saves client to db") do
    new_client = Client.new({:name => "Kim", :stylist_id => 1, :phone => "5555555"})
    new_client.save()
    expect(Client.all()).to(eq([new_client]))
  end
end

describe("#name") do
  it("returns name of client") do
    new_client = Client.new({:name => "Kim", :stylist_id => 1, :phone => "5555555"})
    expect(new_client.name()).to(eq("Kim"))
  end
end

describe("#stylist_id") do
  it("returns stylist_id of client") do
    new_client = Client.new({:name => "Kim", :stylist_id => 1, :phone => "5555555"})
    expect(new_client.stylist_id()).to(eq(1))
  end
end

describe("#phone") do
  it("returns client phone") do
    new_client = Client.new({:name => "Kim", :stylist_id => 1, :phone => "5555555"})
    expect(new_client.phone()).to(eq("5555555"))
  end
end
