class HomeController < ApplicationController
  def analytics
    @heart_data = Heart.where(:start_time => ::DateTime.current.beginning_of_day..::DateTime.current).order(:start_time => :desc).limit(50)
    @sleep = Sleep.last
    @steps = Step.where(:start_time => ::DateTime.current.beginning_of_day..::DateTime.current).order(:start_time => :desc).limit(50)
  end

  def documents
  end

  def logs
  end

  def index
  end

  def slides
  end

  def references
  end
end
