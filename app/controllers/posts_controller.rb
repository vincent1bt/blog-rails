class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :correct_user, only: [:destroy, :update]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
  end

  def mines
    @posts = current_user.posts
  end

  def create
    @post = current_user.posts.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      flash[:notice] = "Post editado"
      redirect_to @post
    else
      render :new
    end
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to @post
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to @post
  end



  private
        def correct_user
          @post = Post.find(params[:id])
          if current_user != @post.user
            redirect_to posts_path
          end
        end


        def posts_params
          params.require(:post).permit(:title,:body,:picture)
        end
end
