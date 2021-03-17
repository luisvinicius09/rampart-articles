class UsersController < ApplicationController
  def profile
    @user_articles = Article.where(user_id: current_user.id)
  end
end