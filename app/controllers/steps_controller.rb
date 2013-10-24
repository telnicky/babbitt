class StepsController < ApplicationController
  respond_to :json
  HIERARCHY = [ :month, :day, :hour, :minute ].freeze
  # expects {:step => {...}}
  def create
    step = Step.new step_params_with_datetime
    declump_step(step).each(&:save!)
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
    @jsonData = { 
                  :name => "StepData", 
                  :children => format_grouping(steps_to_hash(@steps), HIERARCHY.dup)
                }.to_json
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

  def declump_step (step)
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

  def steps_to_hash(steps)
    grouped_steps = build_grouping(steps, :month)
    
    grouped_steps.each do |month, days|
      grouped_steps[month] = build_grouping(days, :day)
      
      grouped_steps[month].each do |day, hours|
        grouped_steps[month][day] = build_grouping(hours, :hour)
        
        grouped_steps[month][day].each do |hour, minutes|
          grouped_steps[month][day][hour] = build_grouping(minutes, :min)
        end
      end
    end
  end

  def build_grouping(steps, by_sym)
    steps.group_by { |s| s.start_time.send(by_sym) }
  end 

  def format_grouping(grouped_steps, categories)
    current_category = categories.first
    grouped_steps.collect do |k, v|
      if v.is_a? ::Hash
        { :name => __send__("format_#{ current_category }", k) ,
          :children => format_grouping(v, categories[1..-1]) }
      else
        { :name => k, :size => v.sum(&:amount) }
      end
    end
  end

  def format_month(m)
    DateTime.new(2000, m).strftime("%B")
  end
   
  def format_day(d)
    d
  end

  def format_hour(h)
    DateTime.new(2000, 1, 1, h).strftime("%I:00 %p")
  end
  
  def format_min(m)
    m
  end
 end

