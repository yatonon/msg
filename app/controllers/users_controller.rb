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
    current_user.update(name: "s")
    current_user.update(email: current_user.email)
    if current_user.user_original?
      current_user.update(user_original: current_user.user_original)
    else
    redirect_to profile_path
    end
  end
end
