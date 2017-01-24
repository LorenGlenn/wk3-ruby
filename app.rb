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
