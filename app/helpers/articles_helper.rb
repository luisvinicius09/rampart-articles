module ArticlesHelper
  def edit_btn(user)
    if user.id == @article.user_id
      link_to 'Edit', edit_article_path(@article)
    end
  end
end
