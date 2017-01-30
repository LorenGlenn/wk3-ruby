require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/stylist")
require("./lib/client")
require("pg")


DB = PG.connect({:dbname => "salon"})

get("/") do
  erb(:index)
end

get("/stylists") do
  @stylists = Stylist.all()
  erb(:stylists)
end

post("/stylists") do
  name = params.fetch("name")
  hours = params.fetch("hours")
  stylist = Stylist.new({:name => name, :hours => hours, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("client_name")
  phone = params.fetch("client_phone")
  stylist_id = params.fetch("stylist_id").to_i()
  client = Client.new({:name => name, :stylist_id => stylist_id, :phone => phone, :id => nil})
  client.save()
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end

get("/stylist_edit/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  hours = params.fetch("hours")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name, :hours => hours})
  erb(:stylist)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/client_edit/:id") do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client_edit)
end

patch("/clients/:id") do
  name = params.fetch("name")
  phone = params.fetch("phone")
  client = Client.find(params.fetch("id").to_i())
  client.update({:name => name, :phone => phone})
  @stylists = Stylist.all()
  erb(:stylists)
end

delete("/clients/:id") do
  @client = Client.find(params.fetch("id").to_i())
  @client.delete()
  @stylists = Stylist.all()
  erb(:stylists)
end
