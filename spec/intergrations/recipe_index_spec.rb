require 'rails_helper'
require 'faker'
include Warden::Test::Helpers

RSpec.feature 'RecipesController', type: :feature do
  before(:each) do
    @user = User.create!(name: Faker::Name.unique.name,
                         email: Faker::Internet.email,
                         password: '1234567', password_confirmation: '1234567')
    @user.skip_confirmation!
  end

  scenario 'should display all recipes with name and description on index' do
    login_as(@user, scope: :user)

    # Add recipes
    recipe1 = Recipe.create(name: 'Recipe 1', description: 'This is the first recipe.', user_id_id: @user.id)
    recipe2 = Recipe.create(name: 'Recipe 2', description: 'This is the second recipe.', user_id_id: @user.id)
    recipe3 = Recipe.create(name: 'Recipe 3', description: 'This is the third recipe.', user_id_id: @user.id)

    # Visit index page
    visit recipes_path

    # Ensure all recipes with name and description are displayed on the index page
    expect(page).to have_content(recipe1.name)
    expect(page).to have_content(recipe1.description)

    expect(page).to have_content(recipe2.name)
    expect(page).to have_content(recipe2.description)

    expect(page).to have_content(recipe3.name)
    expect(page).to have_content(recipe3.description)
  end
end
