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
