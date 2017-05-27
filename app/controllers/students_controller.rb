class StudentsController < ApplicationController

  def index
    @students = policy_scope(Student)
    @assignments = Assignment.all
  end

  def show
    @student = policy_scope(Student)
  end

end
