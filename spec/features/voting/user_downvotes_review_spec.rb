require 'rails_helper'

RSpec.feature "authenticated user downvotes review" , %Q(
  As an authenticated user
  I want to downvote reviews) do

  # Acceptance Criteria:

  # [x] I must be an authenticated user
  # [x] When I visit a product page, I can see reviews of that product
  # [x] Each review has a vote total displayed next to it
  # [x] I can downvote any or all reviews
  # [x] When I downvote the review, the total number of votes is decreased by one
  # [x] I can only downvote once

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user, first_name: "Different name") }
  let!(:product) { FactoryGirl.create(:product) }
  let!(:review1) { FactoryGirl.create(:review, product_id: product.id, user_id: user.id) }


  scenario "authenticated user downvotes review" do

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log In'
    click_link(product.name)
    click_button("downvote-#{review1.id}")


    expect(page).to have_content('User votes score: -1')
    expect(page).to_not have_content('User votes score: 0')
    expect(page).to_not have_content('User votes score: 1')
    expect(page).to have_content("Thank you for your vote!")

  end
end
