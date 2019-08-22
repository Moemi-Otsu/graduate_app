class LikesController < ApplicationController

  def create
    like = current_user.likes.create(talk_id: params[:talk_id])
    redirect_to talks_url, notice: "#{like.talk.user.name}さんの相談をお気に入り登録しました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to talks_url, notice: "#{like.talk.user.name}さんの相談をお気に入り解除しました"
  end

end
