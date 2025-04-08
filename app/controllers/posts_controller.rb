class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created # Send back the created post with 201 status
    else
      render json: @post.errors, status: :unprocessable_entity # Send back errors with 422 status
    end
  end

  private
    # Only allow a list of trusted parameters through for create/update.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
