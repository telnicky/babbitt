class StepsController < ApplicationController
  respond_to :json

  # expects :steps => [{...}, {...}]
  def create
    steps = params[:steps]
    steps.each do |step|
      Step.create(step)
    end
    
    render :json => { :hello => "world" }.to_json
  end

  def new
  end

  def show
  end

  def index
  end

private
  
  # def step_params
  #   params.require(:step).permit!
  # end
end
