require 'spec_helper'

feature "As a user I want to view a list of items
  So that I can pick items to review" do
  scenario "user sees a list of products on main page" do
    # First create a sample user and products
    user1 = FactoryGirl.create(:user)
    product1 = FactoryGirl.create(:product, user_id: user1.id)
    product2 = FactoryGirl.create(:product, user_id: user1.id, name: "Different name")


    # The user visits the index page
    visit root_path


    # And should see the details listed

    expect(page).to have_content("TestGuitar")
    expect(page).to have_content("A description about a test guitar")
    expect(page).to have_content("Different name")

  end
end
