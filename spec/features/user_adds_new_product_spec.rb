require 'spec_helper'

feature "As an authenticated user I want to add an item
    So that others can review it" do
  scenario "user adds a new product on main page" do
    # First create a sample data
    user1 = FactoryGirl.create(:user)
    current_user = user1
    current_user.id = 1
    # The user visits the index page and clicks on link to add new product
    visit root_path
    click_link "Add new product"
    fill_in 'Product Name', with: 'Test name'
    fill_in 'Product Description', with: 'Test description'
    fill_in 'Image_url(optional)', with: 'https://www.taylorguitars.com/sites/default/files/styles/multi_column_guitar_three/public/responsive-guitar-detail/Taylor-214ce-SB-DLX-fr-2014.png?itok=h5-4e-YW'
    # And should see the details listed
    click_button 'Save Product'
    expect(page.current_path).to eq('/products/1')
    expect(page).to have_content("Test name")
    expect(page).to have_content("Test description")
    expect(page).to have_css("img[src*='https://www.taylorguitars.com/sites/default/files/styles/multi_column_guitar_three/public/responsive-guitar-detail/Taylor-214ce-SB-DLX-fr-2014.png?itok=h5-4e-YW']")

  end
end
