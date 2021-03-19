require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  before(:each) do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456')
    @article = assign(:article,
                      user.articles.create(
                          title: 'MyString',
                          content: 'MyText',
                          image_url: 'google.com',
                          category_id: 1
                      ))
  end
end
