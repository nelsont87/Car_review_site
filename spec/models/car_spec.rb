require 'rails_helper'

RSpec.describe Car, type: :model do
  scenario "car" do
    visit car_path
    expect(page).to have_content("Cars")
    expect(page).to have_content("Description")
  end
  scenario "new car" do
    visit new_car_path
    fill_in "name", with: "Porsche 918"
    fill_in "description", with: "Hybrid hypercar designed to be super fast and economical"
    click_button "Submit"
    expect(page).to have_content("New car was successfully created")
  end
  scenario "unsuccessfully creating a new car" do
    visit new_car_path
    click_button "Submit"
    expect(page).to have_content("Could not create new car")
  end
end
