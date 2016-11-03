require 'rails_helper'

feature "As an user - admin I want to add an item
    So that others can review it" do
  scenario "admin successfully adds a new product on main page" do
    #Acceptance CRITERIA
    # I have to sign in as admin
    # I am authorized and I gain access to the system and see a link to add a new item
    # If I don't fill in a name or description I get an error message
    # If I don't add a image_url a default image is added
    # First create a sample data
    user1 = FactoryGirl.create(:user, role: 'admin')
    product = Product.new(name: "Test name", description: "Test description")
    current_user = user1
    # The user(admin) visits the index page where there is no link to add a product

    visit root_path
    expect(page).not_to have_content('Add new product')
    #User signs as admin in and sees the link to add new product
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'
    expect(page).to have_content('Add new product')
    # The user clicks on link to add new product, fills in the product info and cliks to save product
    click_link "Add new product"
    fill_in 'Product Name', with: product.name
    fill_in 'Product Description', with: product.description
    fill_in 'Image_url(optional)', with: product.image_url
    click_button 'Save Product'
    # And should see the details listed
    expect(page).to have_content("Successfully added product.")
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_css("img[src*='#{product.image_url}']")
  end

  scenario "user does not provide valid data and gets error messages" do

    # First create a sample data
    user1 = FactoryGirl.create(:user, role: 'admin')
    product = Product.new(name: "Test name", description: "Test description")
    current_user = user1
    # The user(admin) visits the index page and signs in
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'

    # The user clicks on link to add new product, does not provide name and description
    click_link "Add new product"
    fill_in 'Image_url(optional)', with: product.image_url
    click_button 'Save Product'
    # And should see the details listed
    expect(page).to have_content("2 errors prohibited this product from being saved:")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "user does not provide image_url so default one is added" do

    user1 = FactoryGirl.create(:user, role: 'admin')
    product = Product.new(name: "Test name", description: "Test description")
    current_user = user1
    # The user(admin) visits the index page and signs in
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button 'Log In'

    # The user clicks on link to add new product, fills in the product info(wothout image_url) and cliks to save product
    click_link "Add new product"
    fill_in 'Product Name', with: product.name
    fill_in 'Product Description', with: product.description
    click_button 'Save Product'
    # And should see the details listed
    expect(page).to have_content("Successfully added product.")
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_css("img[src*='/default_picture.jpg']")
  end
end
