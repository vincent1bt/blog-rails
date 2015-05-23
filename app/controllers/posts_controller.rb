class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
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
  end


  private

        def posts_params
          params.require(:post).permit(:title,:body)
        end
end
