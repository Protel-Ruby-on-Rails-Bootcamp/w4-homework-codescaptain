class ProfileController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.availables

    @comments = @user.comments.accepteds
  end

  def feed
    @posts = current_user.feed.ordered_by_created_at
  end
end
