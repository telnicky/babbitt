class SleepsController < ApplicationController
  before_action :set_sleep, only: [:show, :edit, :update, :destroy]

  # GET /sleeps
  # GET /sleeps.json
  def index
    @sleeps = Sleep.all
  end

  # GET /sleeps/1
  # GET /sleeps/1.json
  def show
  end

  # GET /sleeps/new
  def new
    @sleep = Sleep.new
  end

  # GET /sleeps/1/edit
  def edit
  end

  # POST /sleeps
  # POST /sleeps.json
  def create
    @sleep = Sleep.new sleep_params_with_datetime
    @sleep.save!
    render :json => { :hello => "world" }.to_json
  rescue Exception => e
    render :json => { :error => e.message }.to_json
  end 

  # PATCH/PUT /sleeps/1
  # PATCH/PUT /sleeps/1.json
  def update
    respond_to do |format|
      if @sleep.update(sleep_params)
        format.html { redirect_to @sleep, notice: 'Sleep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sleep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sleeps/1
  # DELETE /sleeps/1.json
  def destroy
    @sleep.destroy
    respond_to do |format|
      format.html { redirect_to sleeps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep
      @sleep = Sleep.find(params[:id])
    end

    def sleep_params_with_datetime
      sleep = sleep_params
      sleep[:start_time] =  DateTime.parse sleep[:start_time]
      sleep[:end_time] =  DateTime.parse sleep[:end_time]
      sleep
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sleep_params
      params.require(:sleep).permit!
    end
end
