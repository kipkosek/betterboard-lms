class StudentsController < ApplicationController
  def index
    @students = Student.all
    @assignments = Assignment.all
  end
end
