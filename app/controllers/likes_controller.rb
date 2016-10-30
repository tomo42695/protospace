class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
    @likes = Like.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end
end
