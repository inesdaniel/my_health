class Api::UserPagesController < ApplicationController
  def index
    @user_pages = current_user.shots + current_user.vitals + current_user.exams + current_user.lab_tests
    render "index.json.jbuilder"
  end
end
