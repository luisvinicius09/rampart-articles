require 'rails_helper'

RSpec.describe Article, :type => :model do
  context 'it checks the model' do
    it 'checks if the article belongs to the user' do
      article = Article.reflect_on_association(:user)
      expect(article.macro).to eql(:belongs_to)
    end
  end
end
