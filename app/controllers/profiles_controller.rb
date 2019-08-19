class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    # if params[:image] != nil
    #   image = MiniMagick::Image.read(params[:image])
    #   image.resize_to_fill "100x128"
    #   image.write "public/images/hoge.jpg"
    # end
    if @profile.save
      redirect_to profile_path(@profile.id), notice: "プロフィールを作成しました。"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.id), notice: "プロフィールを編集しました。"
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:age, :image, :image_cache, :working_company, :previous_company, :length_worked, :occupation, :industry, :area, :address)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
