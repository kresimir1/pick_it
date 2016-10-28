require 'rails_helper'

feature 'user signs up', %Q{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date)
} do
  #ACCEPTANCE CRITERIA
  # * I must succesfully sign in
  # * I must find a link to edit my profile
  # * I ener new valid info to my profile and submit
  # * Profile info is changed and saved

  scenario 'user succesfully updates profile information' do

      user = FactoryGirl.create(:user)
      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log In'

      expect(page).to have_content('Welcome back to Pick It!')
      expect(page).to have_content('Edit Profile')
    end


end
