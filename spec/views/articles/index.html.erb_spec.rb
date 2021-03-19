require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456')    
    assign(:articles, [
      user.articles.create(
        title: 'Title',
        content: 'MyText',
        image_url: 'google.com',
        category_id: 1
      ),
      user.articles.create(
        title: 'Title',
        content: 'MyText',
        image_url: 'google.com',
        category_id: 1
      )
    ])
  end
end
