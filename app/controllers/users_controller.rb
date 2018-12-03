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
    if current_user.update(params.require(:user).permit(:name, :email, :user_original))
      redirect_to profile_path
    else
      redirect_to edit_user_path
    end
  end
end
