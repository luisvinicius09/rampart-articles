class VoteController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id

    if @vote.save
      flash[:notice] = 'You upvoted this article!'
    else
      flash[:alert] = "You can't vote in this article!"
    end
    redirect_to article_path(params[:article_id])
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])
    if vote
      vote.destroy
      flash[:notice] = 'You downvoted this article!'
    else
      flash[:alert] = 'Something went wrong with your vote!'
    end
    redirect_to article_path(params[:article_id])
  end

  private

  def vote_params
    params.permit(:article_id)
  end
end
