require 'rails_helper'

feature 'user signs out', %Q{
  As an authenticated user
  I want to sign out
  So that no one else can post items or reviews on my behalf
  } do
  #Acceptance CRITERIA
  # If I am successfully signed in there must be a link to sign out
  # By clicking on that link it desapears and the user is only able to se sign in
  # or sign up links, as well as get a message that I signe out successfully

  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_link 'Sign Out'

    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
    expect(page).not_to have_content('Sign Out')
  end



end
