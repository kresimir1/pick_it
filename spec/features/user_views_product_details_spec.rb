require 'rails_helper'

feature "As user
      I want to view the details about an item
      So that I can get more information about it" do
  scenario "user sees a product details" do
    #Acceptance CRITERIA
    # As a user visiting the index page I see alist of items
    # Each item name is a link to page with product details
    # A product details page has contents: product name, description and image

    # First create a sample user and products
    product1 = FactoryGirl.create(:product)

    # The user visits the index page
    visit root_path
    click_link(product1.name)

    # And should see the details listed
    expect(page).to have_content("TestGuitar")
    expect(page).to have_content("A description about a test guitar")
    expect(page).to have_css("img[src*='/default_picture.jpg']")
  end
end
