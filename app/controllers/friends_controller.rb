class FriendsController < ApplicationController
  add_flash_types :error
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @user = User.where(user_original: params[:uniq])
    @friend = Friend.new()
  end
  # GET /friends/1/edit
  def edit
  end

  def serch
  end

  # POST /friends
  # POST /friends.json
  def create
    @friend = Friend.new(friend_params)
    if @friend.save
      redirect_to friends_serch_path
    elsif Friend.find_by(user_id: friend_params[:user_id], to_id: friend_params[:to_id]).establish?
      redirect_to friends_serch_path, error: ["もう友達だよーん"]
    else
      redirect_to friends_serch_path, error: @friend.errors.full_messages
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_params
      params.require(:friend).permit(:user_id, :to_id, :establish, :apply)
    end
end
