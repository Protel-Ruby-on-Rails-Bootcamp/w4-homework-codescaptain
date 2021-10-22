class CommentsController < ApplicationController
  before_action :set_post, only: %i[ index create show accept deny]
  before_action :object_expire, only: %i[ show ]
  before_action :is_user?, only: %i[ create ]
  def index
    @comments = @post.comments.order(created_at: :desc)

  end

  def is_user?
    unless user_signed_in?
      redirect_to root_path notice: "permission denied"
    end
  end

  def create
    @comment = @post.comments.create(comment_params)
    @comment.update!(user: current_user)
    respond_to do |format|
        format.html { redirect_to @post, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
        format.js
    end
  
  end

  def show
    @comment = @post.comments.find(params[:id])
  end

  def accept
  @comment = @post.comments.find(params[:id])
  @comment.update(accepted: true)

  redirect_to  post_comments_path, notice: 'Comment was successfully approved.'
  end

  def deny
  @comment = @post.comments.find(params[:id])
  @comment.update(accepted: false)

  redirect_to  post_comments_path, notice: 'Comment was successfully denied.'
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

     def object_expire
       @comment = @post.comments.find(params[:id])
      if comment_expired?(@comment.created_at)
        @comment.update!(accepted: true)
      end  
  end

    def comment_expired?(created_at)
      now = Time.now
      expired = created_at+2.day <= now ? true : false
      
    end


    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end
