require 'rails_helper'

feature 'user signs up', %Q{
  As a prospective user
  I want to create an account
  So that I can post items(only admin) and review them (all authenticated users)
} do
  #ACCEPTANCE CRITERIA
  # * I must specify a valid email adress
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated
  scenario 'specifying valid and required information' do
    visit  root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Goran'
    fill_in 'Last Name', with: 'Rukavina'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome to Pick It! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit  root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: ''
    fill_in 'Last Name', with: ''
    fill_in 'Email', with: 'example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email is invalid")


  end

  scenario 'password confiramtion does not match password' do
    visit  root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Goran'
    fill_in 'Last Name', with: 'Rukavina'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'different_password'
    click_button 'Sign Up'
    expect(page).to have_content("Password confirmation doesn't match Password")

  end


end
