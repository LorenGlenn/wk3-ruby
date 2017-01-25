class Client
  attr_reader(:name, :id, :stylist_id, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
    @phone = attributes.fetch(:phone)
  end

  define_singleton_method(:all) do
    all_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    all_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      phone = client.fetch("phone")
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id, :phone => phone}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, stylist_id, phone) VALUES ('#{@name}', #{@stylist_id}, '#{@hours}');")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = self.id()
    @stylist_id = self.stylist_id()
    @phone = attributes.fetch(:phone)
    DB.exec("UPDATE clients SET name = '#{@name}', hours = '#{@hours}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end
end
