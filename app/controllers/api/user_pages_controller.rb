class Api::UserPagesController < ApplicationController
  def index
    # @user_pages = current_user.shots + current_user.vitals + current_user.exams + current_user.lab_tests

    @user_shots = current_user.user_shots.all 
    @user_vitals =  current_user.user_vitals.all 
    render "index.json.jbuilder"
  end

  def create
    result = Result.new(name: params[:name], date_completed: params[:date_completed])
    result.save
    render json: result.as_json
  end

  def show
    result = Result.find_by(id: params[:id])
    render json: result.as_json
  end

  def update
    result = Result.find_by(id: params[:id])
    result.name = params[:name] || result.name
    result.date_completed = params[:date_completed] || result.date_completed
    result.save
    render json: result.as_json    
  end
end
