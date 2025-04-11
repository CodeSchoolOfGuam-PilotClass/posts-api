class PostsController < ApplicationController
  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # POST /posts
  def create
    # commented out strong params for now
    # @post = Post.new(post_params)
    puts "I am in the create action in the posts controller"
    @post = Post.new(
      title: params[:title],
      content: params[:content]
    )

    if @post.save
      render json: @post, status: :created # Send back the created post with 201 status
    else
      render json: @post.errors, status: :unprocessable_entity # Send back errors with 422 status
    end
  end

  def update
    @post = Post.find(params[:id])

    @post.update(
      title: params[:title] || @post.title,
      content: params[:content] || @post.content
    )

    render json: @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: :no_content
  end

  # private
  #   # Only allow a list of trusted parameters through for create/update.
  #   def post_params
  #     params.require(:post).permit(:title, :content)
  #   end
end
