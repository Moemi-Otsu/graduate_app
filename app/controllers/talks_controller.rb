class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]
  # 未ログイン状態でも、閲覧は可能
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

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
    # binding.pry
    @talk = Talk.new(talk_params)
    if @talk.save
      redirect_to talks_path, notice: "相談を投稿しました！"
    else
      render 'new'
    end
  end

  def confirm
    @talk = Talk.new(talk_params)
    render :new if @talk.invalid?
  end

  def show
    @comments = @talk.comments
    @comment = @talk.comments.build
  end

  def edit
  end

  def update
    if @talk.update(talk_params)
      redirect_to talks_path, notice: "編集しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @talk.destroy
    redirect_to talks_path, notice:"削除しました！"
  end

  private

  def talk_params
    params.require(:talk).permit(:title, :content, :complete, category_ids: [])
  end

  def set_talk
    @talk = Talk.find(params[:id])
  end

end
