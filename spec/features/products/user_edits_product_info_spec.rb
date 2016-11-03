require 'rails_helper'

feature "As user - admin I want to edit an existing item info" do
  scenario "admin successfully edits product info" do
    #Acceptance CRITERIA
    # User signs in as admin and sees the link to edit existing product
    # By clicking on edit link user gets redirected to a form where he can edit product info
    user1 = FactoryGirl.create(:user, role: 'admin')
    product = FactoryGirl.create(:product)
    current_user = user1
    # User(admin) visits the index page and sees the existing product list
    visit root_path
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).not_to have_content('Edit')
    # User signs in as admin and sees the edit link
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    expect(page).to have_content('Edit')
    #User edits product info
    click_link 'Edit'
    fill_in 'Product Name', with: 'a different name'
    fill_in 'Product Description', with: 'a different description'
    click_button 'Save Product'
    expect(page).to have_content('Successfully edited product information.')
    expect(page).to have_content('a different name')
    expect(page).to have_content('a different description')
  end
end
