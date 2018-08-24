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
    result_id = params[:id]

    # @result = Shot.find(result_id)
    
    render "show.json.jbuilder" 
  end

end
