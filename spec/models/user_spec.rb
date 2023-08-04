require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    before(:each) do
      @user = User.create(email: 'test@example.com', password: 'password')
      @food1 = Food.create(name: 'Pizza', user: @user)
      @food2 = Food.create(name: 'Burger', user: @user)
    end

    it 'should have many foods' do
      expect(@user.foods).to include(@food1, @food2)
    end
  end
end