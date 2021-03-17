module VoteHelper
  def upvote_or_downvote_btn(article)
    vote = Vote.find_by(article: article, user_id: current_user.id)
    if vote
      link_to('Downvote', article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Upvote', article_vote_index_path(article_id: article.id), method: :post)
    end
  end
end
