require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'it checks the model' do
    it 'checks if the user is valid' do
      user = User.create(name: 'Test', email: 'test@test.com', password: 123456)
      expect(user).to be_valid
    end

    it 'checks if the user is not valid' do
      user = User.create(name: nil, email: nil, password: nil)
      expect(user).to_not be_valid
    end
  end
end
