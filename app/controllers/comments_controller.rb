class CommentsController < ApplicationController
  before_action :parent_talk
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = @talk.comments.build
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.talk_id = @talk.id
    @comment.user_id = current_user.id
    if @talk.complete?
      redirect_to talk_path(@talk.id), notice: "コメントは打ち切られたので投稿できません。"
    else
      if @comment.save
        redirect_to talk_path(@talk.id), notice: "コメントを投稿しました。"
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if current_user.id == @comment.user_id
      if @comment.update(comment_params)
        redirect_to talk_path(@talk.id), notice: "コメントを編集しました。"
      else
        render 'edit'
      end
    else
      redirect_to talk_path(@talk.id), notice: "投稿者以外は編集できません。"
    end
  end

  def destroy
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to talk_path(@talk.id), notice: "コメントを削除しました。"
    else
      redirect_to talk_path(@talk.id), notice: "投稿者以外は編集できません。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:talk_id, :content)
  end

  def parent_talk
    @talk = Talk.find(params[:talk_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end