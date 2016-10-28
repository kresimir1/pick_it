require 'rails_helper'

feature "As an authorized user(admin) I want to delete an item
          So that no one can review it" do
  scenario "admin successfully deletes product from a list" do
    #Acceptance CRITERIA
    # User signs in as admin and sees the link to delete existing product
    # By clicking on delete link next to product user deletes produt and its info

    # First create a sample data
    user1 = FactoryGirl.create(:user, role: 'admin')
    product = FactoryGirl.create(:product)
    current_user = user1
    # The user(admin) visits the index page and sees the existing product list
    visit root_path
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).not_to have_content('Delete')
    # User signs in as admin and sees the delete link
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    expect(page).to have_content('Delete')
    #User deletes product info
    click_link 'Delete'
    visit root_path

    expect(page).not_to have_content(product.name)
    expect(page).not_to have_content(product.description)
  end
end
