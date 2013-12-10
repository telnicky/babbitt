class HeartsController < ApplicationController
  before_action :set_heart, only: [:show, :edit, :update, :destroy]

  # GET /hearts
  # GET /hearts.json
  def index
    @heart_data = Heart.all.order(:start_time => :desc).limit(50)
    @jsonBpmData = Heart.records_to_hierarchy(:bpm, @heart_data).to_json
    @jsonSo2Data = Heart.records_to_hierarchy(:so2_sat, @heart_data).to_json
  end

  # GET /hearts/1
  # GET /hearts/1.json
  def show
  end

  # GET /hearts/new
  def new
    @heart = Heart.new
  end

  # GET /hearts/1/edit
  def edit
  end

  # POST /hearts
  # POST /hearts.json
  def create
    @heart = Heart.new heart_params_with_datetime
    split_heart_by_minute(@heart).each(&:save!)
    render :json => { :hello => "world" }.to_json
  rescue Exception => e
    render :json => { :error => e.message }.to_json
  end

  # PATCH/PUT /hearts/1
  # PATCH/PUT /hearts/1.json
  def update
    respond_to do |format|
      if @heart.update(heart_params)
        format.html { redirect_to @heart, notice: 'Heart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @heart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hearts/1
  # DELETE /hearts/1.json
  def destroy
    @heart.destroy
    respond_to do |format|
      format.html { redirect_to hearts_url }
      format.json { head :no_content }
    end
  end

  private

  def heart_params_with_datetime
    heart = heart_params
    heart[:start_time] =  DateTime.parse heart[:start_time]
    heart[:end_time] =  DateTime.parse heart[:end_time]
    heart
  end

  def split_heart_by_minute(heart)
    pulses = []
    minute_diff = heart.end_time.minute - heart.start_time.minute
    if minute_diff > 1
      minute_diff.times  do | min |
        pulses << (Heart.new(:start_time => (heart.start_time + min.minute),
                             :end_time => (heart.start_time + min.minute + 1.minute),
                             :amount => (heart.amount / minute_diff)))
      end
    else
      pulses << heart
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_heart
    @heart = Heart.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def heart_params
    params.require(:heart).permit!
  end
end
