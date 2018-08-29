class Api::ResultsController < ApplicationController
  def index
    # p current_user
      
    @shots = Shot.all
    @exams = Exam.all
    @vitals = Vital.all 
    @lab_tests = LabTest.all 


    render "index.json.jbuilder"
  end

  def show
    # result_id = params[:id]
    # @result = 
    
    render "show.json.jbuilder" 
  end

  def new
    render "new.json.jbuilder"
  end

  def create
    if (params.has_key?(:exam_id))
      @user_exam = UserExam.new(
        user_id: current_user.id,
        exam_id: params[:exam_id],
        date_completed: "01/01/1900",
      )
      @user_exam.save
    elsif (params.has_key?(:lab_test_id))
      @user_lab_test = UserLabTest.new(
        user_id: current_user.id,
        lab_test_id: params[:lab_test_id],
        date_completed: "01/01/1900"
      )
      @user_lab_test.save
    elsif (params.has_key?(:shot_id))
      @user_shot = UserShot.new(
        user_id: current_user.id,
        shot_id: params[:shot_id],
        date_completed: "01/01/1900",
      )
      @user_shot.save
    elsif (params.has_key? (:vital_id)) 
      @user_vital = UserVital.new(
        user_id: current_user.id,
        vital_id: params[:vital_id],
        date_completed: "01/01/1900",
      )
      @user_vital.save
    end

    # @user_lab_tests
    # @user_shots
    # @user_vitals
    render json: {}
  end

end
