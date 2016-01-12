class PostsController < ApplicationController

  def index
    @comment = Comment.new
  	@posts = Post.all
  end

  def new
    current_user
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
    current_user
  	@post = Post.create(post_params)
    @post.user_id = @currentUser.id
    if params[:title] || params[:content] == ""
      flash[:alert] = "Posts need to have both title and content!"
      redirect_to new_posts_url
  	elsif @post.save
  		flash[:notice] = "Your post was created successfully."
  		redirect_to posts_url
  	else
  		flash[:alert] = "There was a problem saving your post."
  		redirect_to new_post_url
  	end
  end

  def destroy
  	@posts = Post.find(param[:id])
  	@post.destroy
  	# redirect_to
  end


	private   

	def post_params
		params.require(:post).permit(:user_id, :title, :content)   
	end

end
