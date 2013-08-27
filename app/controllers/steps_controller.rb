class StepsController < ApplicationController
  respond_to :json

  # expects {:step => {...}}
  def create
    Step.create step_params
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
  
  def step_params
    params.require(:step).permit!
  end
end
