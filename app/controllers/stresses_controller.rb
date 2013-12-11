class StressesController < ApplicationController
  before_action :set_stress, only: [:show, :edit, :update, :destroy]

  # GET /stresses
  # GET /stresses.json
  def index
    @stresses = Stress.all
  end

  # GET /stresses/1
  # GET /stresses/1.json
  def show
  end

  # GET /stresses/new
  def new
    @stress = Stress.new
  end

  # GET /stresses/1/edit
  def edit
  end

  # POST /stresses
  # POST /stresses.json
  def create
    @stress = Stress.new(stress_params)

    respond_to do |format|
      if @stress.save
        format.html { redirect_to @stress, notice: 'Stress was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stress }
      else
        format.html { render action: 'new' }
        format.json { render json: @stress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stresses/1
  # PATCH/PUT /stresses/1.json
  def update
    respond_to do |format|
      if @stress.update(stress_params)
        format.html { redirect_to @stress, notice: 'Stress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stresses/1
  # DELETE /stresses/1.json
  def destroy
    @stress.destroy
    respond_to do |format|
      format.html { redirect_to stresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stress
      @stress = Stress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stress_params
      params.require(:stress).permit(:integer, :datetime, :datetime)
    end
end
