class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	@post = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
	  	flash[:notice] = "Your post was successfully created!"
	  	redirect_to post_path(@post)
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    if @post.update(post_params)
	    flash[:notice] = "Your post was successfully updated!"
	    redirect_to post_path(@post)
	else
		render :edit
	end
  end

  def show
  end

  def destroy
  	@post.destroy

  	flash[:notice] = "Your post was deleted"
  	redirect_to posts_path
  end


  private
	# Using a private method to encapsulate the permissible parameters is
	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
