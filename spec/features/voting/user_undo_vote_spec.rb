require 'rails_helper'

RSpec.feature "authenticated user changes vote on review" , %Q(
  As an authenticated user
  I want to undo my vote) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I click the vote button of a review I have already upvoted
  #    the total number of votes is reduced by one

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, first_name: "Different name") }
  let!(:product) { FactoryGirl.create(:product) }
  let!(:review1) { FactoryGirl.create(:review, product_id: product.id, user_id: user.id) }


  scenario "authenticated user upvotes review" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log In'
    click_link(product.name)
    click_button("upvote-#{review1.id}")
    click_button("downvote-#{review1.id}")

    expect(page).to have_content('User votes score: 0')
    expect(page).to_not have_content('User votes score: -1')
    expect(page).to_not have_content('User votes score: 1')
    expect(page).to have_content("Your vote has been updated!")

  end
end
