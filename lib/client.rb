class Client
  attr_reader(:name, :id, :phone)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phone = attributes.fetch(:phone)
  end
