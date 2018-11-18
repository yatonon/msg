class ChannelmessagesController < ApplicationController
  before_action :set_channelmessage, only: [:edit, :update, :destroy]

  # GET /channelmessages
  # GET /channelmessages.json
  def index
    @channelmessages = Channelmessage.all
  end

  # GET /channelmessages/1
  # GET /channelmessages/1.json
  def show
    @channelmassages = Channelmessage.new
  end

  # GET /channelmessages/new
  def new
    @channelmessage = Channelmessage.new
  end

  # GET /channelmessages/1/edit
  def edit
  end

  # POST /channelmessages
  # POST /channelmessages.json
  def create
    logger.debug "channelmessage_params #{channelmessage_params}"
    @channelmessage = Channelmessage.new(channelmessage_params)
    @channelmessage.save
    redirect_to channel_path(@channelmessage.channel_id)
  end

  # PATCH/PUT /channelmessages/1
  # PATCH/PUT /channelmessages/1.json
  def update
    respond_to do |format|
      if @channelmessage.update(channelmessage_params)
        format.html { redirect_to @channelmessage, notice: 'Channelmessage was successfully updated.' }
        format.json { render :show, status: :ok, location: @channelmessage }
      else
        format.html { render :edit }
        format.json { render json: @channelmessage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channelmessages/1
  # DELETE /channelmessages/1.json
  def destroy
    @channelmessage.destroy
    respond_to do |format|
      format.html { redirect_to channelmessages_url, notice: 'Channelmessage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channelmessage
      @channelmessage = Channelmessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channelmessage_params
      params.require(:channelmessage).permit(:content, :from_id, :to_id, :channel_id)
    end
end
