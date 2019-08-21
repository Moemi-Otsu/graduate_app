class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    @talk = Talk.find(params[:talk_id])
    @comment.talk_id = @talk.id
    if @comment.save
      redirect_to talk_path(@talk.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:talk_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end