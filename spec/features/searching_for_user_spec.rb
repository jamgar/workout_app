require 'rails_helper'

RSpec.feature "Searching for user" do
  
  before do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Smith", email: "sarah@example.com", password: "password")
  end
  
  scenario "with existing name returns all those users" do
    visit "/"
    
    fill_in "search_name", with: "Smith"
    click_button "Search"
    
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
    expect(current_path).to eq("/dashboard/search")
  end
end