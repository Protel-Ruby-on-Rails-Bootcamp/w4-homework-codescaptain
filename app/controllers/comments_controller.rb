class CommentsController < ApplicationController
  before_action :set_post, only: %i[ index create show accept]
  before_action :is_user?, only: %i[ create ]
  def index
    @comments = @post.comments
  end

  def is_user?
    unless user_signed_in?
      redirect_to root_path notice: "permission denied"
    end
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.update!(user: current_user)

    redirect_to @post, notice: 'Comment was successfully created.'
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def accept
  @comment = @post.comments.find(params[:id])
  @comment.update(accepted: true)

  redirect_to  post_comments_path, notice: 'Comment was successfully approved.'
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end
