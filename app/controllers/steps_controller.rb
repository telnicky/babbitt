class StepsController < ApplicationController
  respond_to :json

  # expects {:step => {...}}
  def create
    Step.create step_params_with_datetime
    render :json => { :hello => "world" }.to_json
  end

  def new
  end

  def show
  end

  def index
    @steps = Step.all
  end

private
  
  def step_params_with_datetime
    step = step_params
    step[:start_time] =  DateTime.parse step[:start_time]
    step[:end_time] =  DateTime.parse step[:end_time]
    step
  end

  def step_params
    params.require(:step).permit!
  end
end
