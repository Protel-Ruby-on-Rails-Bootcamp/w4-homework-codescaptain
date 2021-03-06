class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy up_vote down_vote ]
  before_action :is_user?, only: %i[ edit update destroy ]

  def is_user?
    unless current_user == @post.user
      redirect_to root_path notice: "permission denied"
    end
  end
  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comments = @post.comments.accepteds.order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def up_vote
    @post.update!(vote_count: @post.vote_count + 1)
     
      respond_to do |format|
        format.html { redirect_to @post, notice: "Thanksssss" }
        format.js
      end
  end

  def down_vote
    @post.update!(vote_count: @post.vote_count - 1)
    
     respond_to do |format|
        format.html { redirect_to @post, notice: "Thanksssss" }
        format.js
      end
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to dashboard_index_path, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :visible)
    end
end
