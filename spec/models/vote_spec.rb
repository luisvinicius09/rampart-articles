require 'rails_helper'

RSpec.describe Vote, :type => :model do
  context 'it checks the model' do
    it 'checks if the vote belongs to the article' do
      vote = Vote.reflect_on_association(:article)
      expect(vote.macro).to eql(:belongs_to)
    end

    it 'checks if the vote is valid' do
      user = User.create(name: 'Test', email: 'test@test.com', password: '123456')
      category = Category.create(name: 'Business', priority: 2)
      article = Article.create(title: 'Test', content: 'Testing',
                               user_id: user.id, image_url: 'test.com', category_id: category.id)
      vote = Vote.create(user_id: user.id, article_id: article.id)
      expect(vote).to be_valid
    end

    it 'checks if the vote is not valid' do
      vote = Vote.create(user_id: nil, article_id: nil)
      expect(vote).to_not be_valid
    end
  end
end
