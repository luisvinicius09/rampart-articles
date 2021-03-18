require 'rails_helper'

RSpec.describe Article, :type => :model do
  context 'it checks the model' do
    it 'checks if the article belongs to the user' do
      article = Article.reflect_on_association(:user)
      expect(article.macro).to eql(:belongs_to)
    end

    it 'checks if the article is valid' do
      user = User.create(name: 'test', email: 'test@test.com', password: '123456')

      article = user.articles.create(title: 'Testing', content: 'Testing the post model', image_url: 'google.com.br', category_id: 1)
      expect(article).to be_valid
    end
  end
end
