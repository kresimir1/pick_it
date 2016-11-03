# require 'rails_helper'
#
# feature "As an authenticated user I want to vote on review someone wrote" do
#   scenario "user succesfully votes" do
#
#     # First create a sample user and products
#     user1 = FactoryGirl.create(:user)
#     product1 = FactoryGirl.create(:product)
#     user2 = FactoryGirl.create(:user, first_name: 'different name', last_name: 'different last name', email: 'different@gmail.com')
#     vote = Vote.create(count: 0, voted: false, user_id: 1, review_id: 1)
#     # The user visits the index page and cliks on link to see the product details
#     visit root_path
#
#     click_link 'Sign In'
#     fill_in 'Email', with: user1.email
#     fill_in 'Password', with: user1.password
#     click_button 'Log In'
#     click_link(product1.name)
#     click_link("Add a review for this product")
#     fill_in 'Title', with: 'Test review'
#     fill_in 'Content', with: 'Test content'
#     click_button 'Create Review'
#     click_link 'Sign Out'
#     visit root_path
#
#     click_link 'Sign In'
#     fill_in 'Email', with: user2.email
#     fill_in 'Password', with: user2.password
#     click_button 'Log In'
#     click_link(product1.name)
#     click_button '+'
#
#
#     expect(page).to have_content("Vote saved successfully.")
#     expect(vote.count).to be(1)
#     expect(vote.voted).to be(true)
#   end
# end
