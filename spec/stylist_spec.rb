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
