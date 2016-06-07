require 'rails_helper'

RSpec.feature "Showing Friends Workout" do
  
    before do
    @john = User.create(first_name: "John", last_name: "Smith", email: "john@example.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Jones", email: "sarah@example.com", password: "password")
    login_as(@john)
    
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Body building routine", workout_date: Date.today)
    @e2 = @sarah.exercises.create(duration_in_min: 20, workout: "Cardio", workout_date: Date.today)
    
    @following = Friendship.create(user: @john, friend: @sarah)
  end
  
    scenario "shows friends workout for last 7 days" do
    visit "/"
    
    click_link "My Lounge"
    click_link @sarah.full_name
    
    expect(page).to have_content(@sarah.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end