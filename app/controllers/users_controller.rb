require 'mini_magick'

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def edit
  end

  def profile
  end

  def update
    if current_user.update(user_params)
      if params[:user][:icon_img] != nil
        img_resize(400, 400)
        thumb_resize("public/uploads/user/#{params[:user][:icon_img].original_filename}", 100, 100)
      end
      redirect_to profile_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :user_original, :icon_img)
    end

    def img_resize(width, height)
      img = MiniMagick::Image.read(params[:user][:icon_img])
      img.gravity(:center)
      img.resize "#{width}x#{height}"
      img.write "public/uploads/user/#{params[:user][:icon_img].original_filename}"
    end

    def thumb_resize(path, width, height)
      img = MiniMagick::Image.open(path)
      img.gravity(:center)
      img.resize "#{width}x#{height}"
      img.write "public/uploads/user/thumb/#{params[:user][:icon_img].original_filename}"
    end
end
