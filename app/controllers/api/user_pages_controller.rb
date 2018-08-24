class Api::UserPagesController < ApplicationController
  require 'date'
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
    # result = Vital.find(params[:vital_id])
    user_vital = UserVital.find_by(user_id: params[:user_id], vital_id: params[:vital_id])
    # code that works with day/month/year
    # date = Time.parse(params[:date_completed])
    # user_vital.date_completed = date
    date_string = params[:date_completed]
    datetime = DateTime.strptime(date_string, "%m/%d/%Y")
    p datetime
    user_vital.date_completed = datetime || user_vital.date_completed

    user_vital.save

    render json: user_vital.as_json    
  end

  def destroy
    result = Result.find_by(id: result.id)
    result.destroy
    redirect_to "/user_page"
  end
end
