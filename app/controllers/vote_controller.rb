class VoteController < ApplicationController
  def create
    @vote = Vote.new(user_id: current_user.id, article_id: params[:article_id])

    if @vote.save
      flash[:notice] = 'You upvoted this article!'
      redirect_to article_path(params[:article_id])
    else
      flash[:alert] = "You can't vote in this article!"
      redirect_to article_path(params[:article_id])
    end
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    if vote
      vote.destroy
      flash[:notice] = 'You downvoted this article!'
      redirect_to article_path(params[:article_id])
    else
      flash[:alert] = "Something went wrong with your vote!"
      redirect_to article_path(params[:article_id])
    end
  end
end
