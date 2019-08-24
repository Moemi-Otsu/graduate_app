class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]
  # 未ログイン状態でも、閲覧は可能
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def top
    @talks = Talk.all
    @categories = Category.all
  end

  def index
    @talks = Talk.all
    @categories = Category.all
  end

  def new
    if params[:back]
      @talk = Talk.new(talk_params)
    else
      @talk = Talk.new
    end
  end

  def create
    @talk = Talk.new(talk_params)
    @talk.user_id = current_user.id
    if @talk.save
      redirect_to talks_path, notice: "相談を投稿しました！"
    else
      render 'new'
    end
  end

  def confirm
    @talk = Talk.new(talk_params)
    @talk.user_id = current_user.id
    render :new if @talk.invalid?
  end

  def show
    @comments = @talk.comments
    @like = current_user.likes.find_by(talk_id: @talk.id) if current_user.present?
  end

  def edit
  end

  def update
    if current_user.id == @talk.user_id
      if @talk.update(talk_params)
        redirect_to talks_path, notice: "編集しました。"
      else
        render 'edit'
      end
    else
      redirect_to talks_path, notice: "投稿者以外は編集できません。"
    end
  end

  def destroy
    if current_user.id == @talk.id
      @talk.destroy
      redirect_to talks_path, notice:"削除しました！"
    else
      redirect_to talks_path, notice: "投稿者以外は削除できません。"
    end
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :content, :complete, category_ids: [])
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end

end
