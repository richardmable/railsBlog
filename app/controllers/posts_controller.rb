class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	# @post = Post.find(params[:id])

  	puts "***************"
  	puts "THESE ARE THE PARAMS"
  	puts params[:post]
  	# redirect_to root_path
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = "Your post was created successfully."
  		redirect_to post_path @post
  	else
  		flash[:alert] = "There was a problem saving your post."
  		redirect_to post_path notice: "Post was posted"
  	end
  end

  def destroy
  	@posts = Post.find(param[:id])
  	@post.destroy
  	# redirect_to
  end


	private   

	def post_params
		params.require(:post).permit(:title, :content)   
	end

end
