class Client
  attr_reader(:name, :stylist_id, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)
    @phone = attributes.fetch(:phone)
  end

  define_singleton_method(:all) do
    all_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    all_clients.each() do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i()
      phone = client.fetch("phone")
      clients.push(Client.new({:name => name, :stylist_id => stylist_id, :phone => phone}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, stylist_id, phone) VALUES ('#{@name}', #{@stylist_id}, '#{@hours}');")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.stylist_id().==(another_client.stylist_id())).&(self.phone().==(another_client.phone()))
  end

  define_singleton_method(:find) do |name|
    found_client = nil
    Client.all().each() do |client|
      if client.name().==(name)
        found_client = client
      end
    end
    found_client
  end
end
