require 'rails_helper'

feature "As an authenticated user I want to add a review of the product
      on the product details page" do
  scenario "user succesfully adds a review" do
    #Acceptance CRITERIA
    # As a user visiting the index page I see alist of items
    # Each item name is a link to page with product details
    # A product details page has contents: product name, description and image
    # To add a review I must be authenticated
    # By clicking on the link to add a review and providing a valid information
    # I am redirected back to the product details page with my review listed under

    # First create a sample user and products
    user1 = FactoryGirl.create(:user)
    product1 = FactoryGirl.create(:product)

    # The user visits the index page and cliks on link to see the product details
    visit root_path
    click_link(product1.name)
    # And should see the details listed
    expect(page).to have_content("TestGuitar")
    expect(page).to have_content("A description about a test guitar")
    expect(page).to have_css("img[src*='/default_picture.jpg']")

    # User is not able to add a new review before signing in
    expect(page).not_to have_content("Add a review for this product")

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    click_link(product1.name)

    expect(page).to have_content("Add a review for this product")

    click_link("Add a review for this product")

    fill_in 'Title', with: 'Test review'
    fill_in 'Content', with: 'Test content'
    click_button 'Create Review'

    expect(page).to have_content("Review saved successfully.")
    expect(page).to have_content("Test review")
    expect(page).to have_content("Test content")
  end

    scenario "user provides invalid information" do
      user1 = FactoryGirl.create(:user)
      product1 = FactoryGirl.create(:product)

      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user1.email
      fill_in 'Password', with: user1.password
      click_button 'Log In'
      click_link(product1.name)
      click_link("Add a review for this product")


      fill_in 'Title', with: ''
      fill_in 'Content', with: ''
      click_button 'Create Review'

      expect(page).to have_content("Content can't be blank")
      expect(page).to have_content("Title can't be blank")
    end
end
