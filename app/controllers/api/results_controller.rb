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
# figure out why user_exam is not saving. params passing. getting rollback
# if get it to work, do same for shots/vitals/lab_tests
  def create
    @user_exam = UserExam.new(
      user_id: current_user.id,
      exam_id: params[:exam_id],
      date_completed: "01/01/1900"
    )
    @user_exam.save

    render json: {message: @user_exam.errors.full_messages}
    # @user_lab_tests
    # @user_shots
    # @user_vitals
  end

end
