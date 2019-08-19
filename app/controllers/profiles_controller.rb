class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if params[:image] != nil
      image = MiniMagick::Image.read(params[:image])
      image.resize_to_fill "100x100"
      image.write "public/images/hoge.jpg"
    end
    if @profile.save
      redirect_to profile_path(@profile.id), notice: "プロフィールを作成しました。"
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  private

  def profile_params
    params.require(:profile).permit(:age, :image, :image_cache, :working_company, :previous_company, :length_worked, :occupation, :industry, :area)
  end

  def set_profiles
    @blog = Blog.find(params[:id])
  end

end
