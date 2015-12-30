class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		flash[:notice] = "The comment was added"

		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

	  	flash[:notice] = "The comment was removed"
	  	redirect_to post_path(@post)
	end

private

	def comment_params
		params.require(:comment).permit(:namee, :body)
	end

end
