class HomeController < ApplicationController
  def analytics
    @heart_data = Heart.all.order(:start_time => :desc).limit(50)
    @sleep = Sleep.all.order(:start_time => :desc).limit(50)
    @steps = Step.all.order(:start_time => :desc).limit(50)
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
