require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add stylist', {:type => :feature}) do
  it('lets user add a new stylist') do
    visit('/')
    fill_in('name', 'hours', :with =>'Kim', '9-5')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end

describe('view all stylists', {:type => :feature}) do
  it('shows all current stylists') do
    stylist = Stylist.new({:name => 'Kim', :hours => '9-5'})
    stylist.save()
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content(stylist.name)
  end
end

describe('view stylist', {:type => :feature}) do
  it('shows clients and hours for stylist') do
    new_stylist = Stylist.new({:name => 'Kim', :hours => '9-5'})
    new_stylist.save()
    new_client = Client.new({:name => "Bob", :id => nil, :stylist_id => new_stylist.id(), :phone => "5555555"})
    new_client.save()
    visit('/stylists')
    click_link(new_stylist.name())
    expect(page).to have_content(new_client.name())
  end
end

describe('adding a client to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    new_stylist =Stylist.new({:name => 'Kim', :hours => '9-5'})
    new_stylist.save()
    visit("/stylist/#{new_stylist.id()}")
    fill_in("name", "phone" {:with => "Bob", "5555555"})
    click_button("Add client")
    expect(page).to have_content("Success!")
  end
end
