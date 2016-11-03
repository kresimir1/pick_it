require 'rails_helper'

feature "As user
      I want to be able to search for products on the index page" do
  scenario "user sees a product details" do
    #Acceptance CRITERIA
    # As a user visiting the index page I want to see search box above
    # the list of items
    # When I type a term I should get a list of items that have that term in the
    # name or description
    # If a term has no matches I should get a message informing me

    # First create a sample user and products
    product1 = FactoryGirl.create(:product)

    # The user visits the index page
    visit root_path
    fill_in 'Search Products', with: product1.description
    click_button('Search')
    # save_and_open_page
    # And should see the product listed
    expect(page).to have_content("TestGuitar")
    expect(page).to have_content("A description about a test guitar")

    visit root_path
    fill_in 'Search Products', with: product1.name
    click_button('Search')
    # save_and_open_page
    # And should see the product listed
    expect(page).to have_content("TestGuitar")
    expect(page).to have_content("A description about a test guitar")
  end
  scenario "user types looks for a term that does not exist on page" do

    # First create a sample user and products
    product1 = FactoryGirl.create(:product)

    # The user visits the index page
    visit root_path
    fill_in 'Search Products', with: 'whatever does not exist here'
    click_button('Search')
    # And should see the product listed
    expect(page).to have_content("There are no products containing the term(s)")
  end
end
