require('spec_helper')

describe(Client) do
  describe(".all") do
    it("cleared each time, no clients") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves client to db") do
      new_client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      new_client.save()
      expect(Client.all()).to(eq([new_client]))
    end
  end

  describe("#name") do
    it("returns name of client") do
      new_client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      expect(new_client.name()).to(eq("Kim"))
    end
  end

  describe("#stylist_id") do
    it("returns stylist_id of client") do
      new_client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      expect(new_client.stylist_id()).to(eq(1))
    end
  end

  describe("#phone") do
    it("returns client phone") do
      new_client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      expect(new_client.phone()).to(eq("5555555"))
    end
  end

  describe("#==") do
    it("client is the same if ids are equal") do
      client1 = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      client2 = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      expect(client1).to(eq(client2))
    end
  end

  describe(".find") do
    it("returns first client by name") do
      new_client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      new_client.save()
      new_client2 = Client.new({:name => "Jim", :id => nil, :stylist_id => 2, :phone => "6666666"})
      new_client2.save()
      expect(Client.find(new_client2.id())).to(eq(new_client2))
    end
  end

  describe("#update") do
    it("saves updated client info in db") do
      client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      client.save()
      client.update({:name => "Jim", :phone => "6666666"})
      expect(client.name()).to(eq("Jim"))
    end
  end

  describe("#delete") do
    it("delete a specific client from the db") do
      client = Client.new({:name => "Kim", :id => nil, :stylist_id => 1, :phone => "5555555"})
      client.save()
      client2 = Client.new({:name => "Jim", :id => nil, :stylist_id => 2, :phone => "6666666"})
      client2.save()
      client.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end
end
