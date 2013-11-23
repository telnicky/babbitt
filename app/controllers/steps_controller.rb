class StepsController < ApplicationController
  respond_to :json

  # expects {:step => {...}}
  def create
    step = Step.new step_params_with_datetime
    split_step_by_minute(step).each(&:save!)
    render :json => { :hello => "world" }.to_json
  rescue Exception => e
    render :json => { :error => e.message }.to_json
  end

  def new
  end

  def show
  end

  def index
    @steps = Step.all
    @jsonData = Step.records_to_hierarchy(:amount, @steps).to_json
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

  def declump_step(step)
    steps = []
    minute_diff = step.end_time.minute - step.start_time.minute
    if minute_diff > 1
      minute_diff.times  do | min |
        steps << (Step.new(:start_time => (step.start_time + min.minute),
                           :end_time => (step.start_time + min.minute + 1.minute),
                           :amount => (step.amount / minute_diff)))
      end
    else
      steps << step
    end
  end
 end

