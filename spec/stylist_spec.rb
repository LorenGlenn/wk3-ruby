require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("is cleared each time, should be empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("grabs the name from the object") do
      stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      expect(stylist.name()).to(eq("Bob"))
    end
  end

  describe("#id") do
    it("makes sure the stylist has an id") do
      stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves your stylist to the database") do
      stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("stylists are the same if name and id are same") do
      stylist1 = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      stylist2 = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe(".find") do
    it("finds a stylist by id") do
      new_stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      new_stylist.save()
      new_stylist2 = Stylist.new({:name => "Jim", :id => nil, :hours => "9-1"})
      new_stylist2.save()
      expect(Stylist.find(new_stylist2.id())).to(eq(new_stylist2))
    end
  end

  describe("#update") do
    it("saves updated stylist info in db") do
      stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      stylist.save()
      stylist.update({:name => "Jim", :hours => "8-3"})
      expect(stylist.name()).to(eq("Jim"))
    end
  end

  describe("#delete") do
    it("delete a specific stylist from the db") do
      stylist = Stylist.new({:name => "Bob", :id => nil, :hours => "9-5"})
      stylist.save()
      stylist2 = Stylist.new({:name => "Jim", :id => nil, :hours => "9-1"})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
