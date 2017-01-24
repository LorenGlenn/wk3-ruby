class Stylist
  attr_reader(:name, :id, :hours)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    all_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      hours = stylist.fetch("hours")
      stylists.push(Stylist.new({:name => name, :id => id, :hours => hours}))
    end
    stylists
  end
