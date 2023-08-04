require 'rails_helper'
require 'faker'
include Warden::Test::Helpers

RSpec.feature 'Food show', type: :feature do
    before(:each) do
    @user = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '123456', password_confirmation: '123456')
    @user.skip_confirmation!
    @food = Food.create(name: 'chapati', measurement_unit: 'pound',
                        price: 40, quantity: 3, user_id_id: @user.id)
  end

  scenario 'should display food name' do
    visit food_path(@food)
    expect(page).to have_content(@food.name)
  end

  scenario 'should display measurement unit' do
    visit food_path(@food)
    expect(page).to have_content(@food.measurement_unit)
  end

  scenario 'Can see food price' do
    visit food_path(@food)
    expect(page).to have_content(@food.price)
  end

  scenario 'Can see food quantity' do
    visit food_path(@food)
    expect(page).to have_content(@food.quantity)
  end

  scenario 'Can see edit food link' do
    visit food_path(@food)
    expect(page).to have_link('Edit this food', href: edit_food_path(@food))
  end

  scenario 'Can see delete food button' do
    visit food_path(@food)
    expect(page).to have_button('Destroy this food', type: 'submit')
  end
end
