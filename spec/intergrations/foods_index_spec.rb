require 'rails_helper'
require 'faker'
include Warden::Test::Helpers

RSpec.feature 'User recipe index', type: :feature do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @food = Food.create(name: 'chapati', measurement_unit: 'pound',
                        price: 40, quantity: 3, user_id_id: @user.id)
  end

  scenario 'should display food name' do
    login_as(@user, scope: :user)
    visit foods_path
    expect(page).to have_content(@food.name)
  end

  scenario 'should display measurement unit' do
    login_as(@user, scope: :user)
    visit foods_path
    expect(page).to have_content(@food.measurement_unit)
  end

  scenario 'Can see food price' do
    login_as(@user, scope: :user)
    visit foods_path
    expect(page).to have_content(@food.price)
  end

  scenario 'Can see food quantity' do
    login_as(@user, scope: :user)
    visit foods_path
    expect(page).to have_content(@food.quantity)
  end

  scenario 'Can see add food button' do
    login_as(@user, scope: :user)
    visit foods_path
    expect(page).to have_content('New food')
  end
end
