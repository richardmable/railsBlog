class PostsController < ApplicationController

  def index
    @comment = Comment.new
  	@posts = Post.all
  end

  def new
    current_user
    no_current_user
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
    current_user
    no_current_user
    telegram
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
  end

  #following code turns post into a telegram look a like, and figures out the cost circa...today!
  def telegram
    #capatalize the title
    post_params[:title].upcase!
    content = post_params[:content]
    #count every char in the content of the post
    charCount = content.count("a-z")
    #this is computer by figuring that a: there is a telegram service in Canada that exists today
    #http://www.globalpost.com/dispatch/news/the-canadian-press/130618/you-can-still-send-telegram-2013-itll-cost-you-19
    #$18.95 divided by 100 words, at 4 chars avg a word, equals 4.7375 cents per char.
    #in the future, store monetary values as int, millicents (the amount of money * 1000 as an integer)
    #this way you do not lose the rounding errors of floats
    cost = ((charCount.to_f * 4.7375) / 100.00)
    #replace every period with the classic STOP as it used to be, and make the whole contents upper case.
    content.gsub!(/\./, ' -(STOP)- ').upcase!
    #set the newly formatted post to params[:content] so that it can be passed into post.create
    post_params[:content] = content
    post_params[:cost] = cost
  end

	private   

	def post_params
		params.require(:post).permit(:user_id, :title, :content, :cost)   
	end

end
