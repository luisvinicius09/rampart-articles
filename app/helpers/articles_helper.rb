module ArticlesHelper
  def edit_btn(user)
    link_to 'Edit', edit_article_path(@article), class: 'vote-btn' if user.id == @article.user_id
  end

  def form_error(error)
  end
end
