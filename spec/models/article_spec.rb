require 'rails_helper'

RSpec.describe Article, :type => :model do
  context 'it checks the model' do
    it 'checks if the article belongs to the user' do
      article = Article.reflect_on_association(:user)
      expect(article.macro).to eql(:belongs_to)
    end

    it 'checks if the article is valid' do
      user = User.create(name: 'Test', email: 'test@test.com', password: 123456)
      category = Category.create(name: 'Business', priority: 2)
      article = Article.create(title: 'Test', content: 'Testing',
                               user_id: user.id, image_url: 'test.com', category_id: category.id)
      expect(article).to be_valid
    end

    it 'checks if the article is not valid' do
      user = User.create(name: 'Test', email: 'test@test.com', password: 123456)
      category = Category.create(name: 'Business', priority: 2)
      article = Article.create(title: nil, content: nil,
                               user_id: user.id, image_url: nil, category_id: category.id)
      expect(article).to_not be_valid
    end
  end
end
