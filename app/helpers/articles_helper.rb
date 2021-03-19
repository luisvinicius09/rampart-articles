module ArticlesHelper
  def edit_btn(user)
    link_to 'Edit', edit_article_path(@article), class: 'vote-btn' unless user.id == @article.user_id
  end
end
