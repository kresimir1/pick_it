require 'rails_helper'

feature "As an authenticated user I want to be able to delete a review of the product
      that I submited" do
  scenario "user succesfully deletes a review" do
    #Acceptance CRITERIA
    # As a user visiting the product details page I see a list of reviews
    # To delete a review I must be authenticated
    # If a rivew was written by me I see the link to delete the review
    # If a rivew was not written by me I do not see the link to edit the review
    # By clicking on the link I delete the rivew and its contents
    # I am redirected back to the product details page where rivew no longer appears

    # First create a sample user and products
    user1 = FactoryGirl.create(:user)
    product1 = FactoryGirl.create(:product)

    # The user visits the index page and cliks on link to see the product details
    visit root_path
    click_link(product1.name)

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    click_link(product1.name)
    click_link("Add a review for this product")
    fill_in 'Title', with: 'Test review'
    fill_in 'Content', with: 'Test content'
    click_button 'Create Review'

    expect(page).to have_content("Test review")
    expect(page).to have_content("Test content")
    expect(page).to have_content("Delete", count:2)# Delete profile, edit review

    click_link("Delete")

  
    expect(page).not_to have_content("Test review")
    expect(page).not_to have_content("Test content")
    expect(page).to have_content("Successfully deleted the review.")

  end

    scenario "user can't delete review they didn't submit" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user, first_name: 'different name', last_name: 'different last name')
      product1 = FactoryGirl.create(:product)

      visit root_path
      click_link(product1.name)

      #user 1 signs in and creates a review after which he sign out
      click_link 'Sign In'
      fill_in 'Email', with: user1.email
      fill_in 'Password', with: user1.password
      click_button 'Log In'
      click_link(product1.name)
      click_link("Add a review for this product")
      fill_in 'Title', with: 'Test review'
      fill_in 'Content', with: 'Test content'
      click_button 'Create Review'
      click_link('Sign Out')

      #user 2 signs in and goes to the product detail page
      click_link 'Sign In'
      fill_in 'Email', with: user2.email
      fill_in 'Password', with: user2.password
      click_button 'Log In'
      click_link(product1.name)

      expect(page).to have_content("Test review")
      expect(page).to have_content("Test content")
      expect(page).to have_content("Delete Profile")
      # Delete - rivew would be second edit on the page
      expect(page).not_to have_content("Delete", count: 2)
    end
end
