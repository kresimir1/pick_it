require 'rails_helper'



feature "As an authorized admin I want to be able to delete any review of the product
      on the page including the ones other users submited" do
  scenario "admin succesfully deletes a review" do
    #Acceptance CRITERIA
    # As a user visiting the product details page I see a list of reviews
    # To delete a any review I must be authenticated and authorized as admin
    # If a rivew was not written by me I see the link to edit the review
    # By clicking on the link I delete the rivew and its contents
    # I am redirected back to the product details page where rivew no longer appears

    # First create a sample user and products
    user1 = FactoryGirl.create(:user, role: 'admin')
    user2 = FactoryGirl.create(:user, first_name: 'different name', last_name: 'different last name')

    product1 = FactoryGirl.create(:product)

    # The user (not admin adds a review)
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log In'
    click_link(product1.name)
    click_link("Add a review for this product")
    fill_in 'Title', with: 'Test review'
    fill_in 'Content', with: 'Test content'
    click_button 'Create Review'

    expect(page).to have_content("Test review")
    expect(page).to have_content("Test content")
    expect(page).to have_content("Delete", count:2)# Delete profile, edit review

    click_link('Sign Out')
    expect(page).to have_content("Signed out successfully.")

    #admin signs in and deletes the rivew of the product
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    click_link(product1.name)
    click_link('Delete')

    expect(page).not_to have_content("Test review")
    expect(page).not_to have_content("Test content")
    expect(page).to have_content("Successfully deleted the review.")

  end

end
