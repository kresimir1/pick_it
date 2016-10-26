require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_valid(:name).when('Fender Telecaster El. Guitar', 'Gibson') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:description).when('A great guitar. Good value for your money', 'Just some description') }
  it { should_not have_valid(:description).when(nil, '') }

  it { should have_valid(:image_url).when('something/something', 'another/something') }
  it { should_not have_valid(:image_url).when(nil, '') }


end
