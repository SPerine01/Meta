class PostsController < ApplicationController
  def index
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.save
  end

  def edit
  end

  def show
  	redirect_to show_path
  end

  def update
  end

  def destroy
  end


  private
	# Using a private method to encapsulate the permissible parameters is
	def post_params
		params.require(:post).permit(:title, :body)
	end

end
