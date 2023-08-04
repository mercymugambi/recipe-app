require 'rails_helper'
require 'faker'
include Warden::Test::Helpers

RSpec.feature 'PublicRecipesController', type: :feature do
  before(:each) do
    @user = User.create!(
      name: Faker::Name.unique.name,
      email: Faker::Internet.email,
      password: '1234567',
      password_confirmation: '1234567'
    )

    @public_recipe = Recipe.create!(
      name: 'Public Recipe 1',
      description: 'This is a public recipe.',
      public: true,
      user_id_id: @user.id
    )

    @private_recipe = Recipe.create!(
      name: 'Private Recipe 1',
      description: 'This is a private recipe.',
      public: false,
      user_id_id: @user.id
    )
  end

  scenario 'should display public recipes on public recipes index page' do
    visit public_recipes_path

    expect(page).to have_content(@public_recipe.name)

    expect(page).not_to have_content(@private_recipe.name)
  end
end
