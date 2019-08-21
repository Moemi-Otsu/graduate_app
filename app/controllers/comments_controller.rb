class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.build
  end

  # コメントを保存、投稿するためのアクションです。
  def create
    # Talkをパラメータの値から探し出し,Talkに紐づくcommentsとしてbuildします。
    @talk = Talk.find(params[:talk_id])
    @comment = @talk.comments.build(comment_params)
    # クライアント要求に応じてフォーマットを変更
    # respond_to do |format|
    #   if @comment.save
    #     format.js { render :index }
    #   else
    #     format.html { redirect_to talk_path(@talk), notice: "投稿できませんでした…" }
    #   end
    # end
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