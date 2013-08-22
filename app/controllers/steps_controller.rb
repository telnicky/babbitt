class StepsController < ApplicationController
  respond_to :json

  def create
    render :json => { :hello => "world" }.to_json
  end

  def new
  end

  def show
  end

  def index
  end
end
