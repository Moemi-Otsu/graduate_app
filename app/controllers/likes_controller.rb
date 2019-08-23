class LikesController < ApplicationController
  before_action :set_talk

  def create
    @like = Like.create(user_id: current_user.id, talk_id: params[:talk_id])
    @likes = Like.where(talk_id: params[:talk_id])
    @talk.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, talk_id: params[:talk_id])
    like.destroy
    @likes = Like.where(talk_id: params[:talk_id])
    @talk.reload
  end

  private

  def set_talk
    @talk = Talk.find(params[:talk_id])
  end

end
