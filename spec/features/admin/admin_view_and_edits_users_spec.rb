require 'rails_helper'

feature "As admin I want to be able to see a list of users an item and delete a user" do
  scenario "admin views list of users" do
    #Acceptance CRITERIA
    # User signs in as admin and sees the link to existing users list
    # By clicking on delete link next to user deletes user and its info

    # First create a sample data
    user1 = FactoryGirl.create(:user, role: 'admin')
    user2 = FactoryGirl.create(:user)
    # The user visits the index page and before signing in does not see a list of users
    visit root_path
    expect(page).not_to have_content('Members')
    # User signs in as admin and sees the Members link
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    expect(page).to have_content('Members')
    click_link 'Members'
    #User sees list of users and their info
    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user1.last_name)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user2.email)
    expect(page).to have_content(user2.first_name)
    expect(page).to have_content(user2.last_name)
  end
  scenario "admin deletes a user from the list" do
    # First create a sample data
    user2 = FactoryGirl.create(:user, first_name: 'Different name', last_name: 'Different Lastname')
    user1 = FactoryGirl.create(:user, role: 'admin')
    visit root_path

    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    expect(page).to have_content('Members')
    click_link 'Members'

    #delete the first useron the list(not admin)
    first(:link, 'Remove user').click
    expect(page).to have_content(user1.first_name)
    expect(page).to have_content(user1.last_name)
    expect(page).to have_content(user1.email)
    expect(page).not_to have_content(user2.email)
    expect(page).not_to have_content(user2.first_name)
    expect(page).not_to have_content(user2.last_name)
  end

end
