require 'rails_helper'

RSpec.describe User, type: :model do
  context 'it checks the model' do
    it 'checks if the user is valid' do
      user = User.create(name: 'test', email: 'test@test.com', password: '123456')
      expect(user).to be_valid
    end
  end
end
