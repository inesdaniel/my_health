class Api::UserPagesController < ApplicationController
  require 'date'
  def index
    # @user_pages = current_user.shots + current_user.vitals + current_user.exams + current_user.lab_tests

    @user_shots = current_user.user_shots.all 
    @user_vitals =  current_user.user_vitals.all 
    @user_exams = current_user.user_exams.all
    @user_lab_tests = current_user.user_lab_tests
    render "index.json.jbuilder"
  end

  def create
    result = Result.new(name: params[:name], date_completed: params[:date_completed])
    result.save
    render json: result.as_json
  end

  def show #nice to have
    # need to display old dates here(when click name link)
    # if (params.has_key? (:vital_id)) 
    #   user_vital = UserVital.find_by(user_id: params[:user_id], vital_id: params[:vital_id])
    #   # old_dates_completed << user_vital.vital_id
    #   @dates = user_vital.vital_name + user_vital.date_completed
    # elsif (params.has_key?(:shot_id))
    #   user_shot = UserShot.find_by(user_id: params[:user_id], shot_id: params[:shot_id])
      
    # elsif (params.has_key?(:exam_id))
    #   user_exam = UserExam.find_by(user_id: params[:user_id], exam_id: params[:exam_id])
      
    # elsif (params.has_key?(:lab_test_id))
    #   user_lab_test = UserLabTest.find_by(user_id: params[:user_id], lab_test_id: params[:lab_test_id])         
     
    # end

    # render json: user_shot.as_json || user_vital.as_json || user_exam.as_json || user_lab_test.as_json
  end

  def update
    # old_dates_completed = []
    if (params.has_key? (:vital_id)) 
      user_vital = UserVital.find_by(user_id: params[:user_id], vital_id: params[:vital_id])

      result = params[:result]
      user_vital.result = result || user_vital.result

      date_string = params[:date_completed]
      datetime = DateTime.strptime(date_string, "%m/%d/%Y")
      user_vital.date_completed = datetime || user_vital.date_completed
      user_vital.save
    elsif (params.has_key?(:shot_id))
      user_shot = UserShot.find_by(user_id: params[:user_id], shot_id: params[:shot_id])
      date_string = params[:date_completed]
      datetime = DateTime.strptime(date_string, "%m/%d/%Y")
      user_shot.date_completed = datetime || user_shot.date_completed
      user_shot.save
    elsif (params.has_key?(:exam_id))
      user_exam = UserExam.find_by(user_id: params[:user_id], exam_id: params[:exam_id])
      date_string = params[:date_completed]
      datetime = DateTime.strptime(date_string, "%m/%d/%Y")
      user_exam.date_completed = datetime || user_exam.date_completed
      user_exam.save 
    elsif (params.has_key?(:lab_test_id))
      user_lab_test = UserLabTest.find_by(user_id: params[:user_id], lab_test_id: params[:lab_test_id])    

      result = params[:result]
      user_lab_test.result = result || user_lab_test.result

      date_string = params[:date_completed]
      datetime = DateTime.strptime(date_string, "%m/%d/%Y")
      user_lab_test.date_completed = datetime || user_lab_test.date_completed
      user_lab_test.save  
    end

    render json: user_shot.as_json || user_vital.as_json || user_exam.as_json || user_lab_test.as_json
  end

  def destroy
    user_lab_test = UserLabTest.find_by(id: user_lab_test.id)
    user_lab_test.destroy
    redirect_to "/user_page"
  end
end
