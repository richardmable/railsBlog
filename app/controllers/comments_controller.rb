class CommentsController < ApplicationController
  def index
  	current_user
  	@comment = Comment.new
  end

  def new
  	current_user
  	@comment = Comment.new
  end

  def create
  	current_user
  	@comment = Comment.new(comment_params)
  	@comment.user_id = @currentUser.id
  	puts comment_params
  	if params[:title] || params[:content] == ""
      flash[:alert] = "Comments need to have both title and content!"
      redirect_to posts_url
  	elsif @comment.save
  		flash[:notice] = "Your comment was posted."
  		redirect_to posts_url
  	else
  		flash[:alert] = "There was a problem creating your commment."
  		redirect_to posts_url
  	end
  end


  def show
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :title, :content)
  end
end
