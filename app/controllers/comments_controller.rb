class CommentsController < ApplicationController
  before_action :set_comment, only: [ :show, :edit, :update, :destroy ]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: "Comment was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def index
    @comments = Comment.all
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: "Comment was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def comment_params
      params.require(:comment).permit(:value, :score_id, :user_id)
    end
end
