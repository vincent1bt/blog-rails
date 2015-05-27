class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post
  before_action :authenticate_user!
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post , notice: 'Comentario creado' }
        format.json { render :show, status: :created, location: @post }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:user_id, :article_id, :body)
    end

end
