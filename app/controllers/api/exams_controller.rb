class Api::ExamsController < ApplicationController
  def index
    @exams = Exam.all
    render "index.json.jbuilder"
  end

  def show
    @exam = Exam.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def new
    render "new.json.jbuilder"
  end

  def create
    @exam = Exam.new(
      name: params[:name],
    )
    @exam.save
  end

  def destroy
    @exam = Exam.find_by(id: params[:id])
    @exam.destroy
  end
end
