class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ index ]
  def index
    @posts = @user.posts.availables

    @comments = @user.comments.accepteds
  end

  def feed
    @posts = current_user.feed.ordered_by_created_at

    @best_posts = Post.ordered_by_vote_count.where.not(user_id: current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
