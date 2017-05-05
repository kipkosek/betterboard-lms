class Instructor::SubmissionsController < ApplicationController
  before_action :authenticate_instructor
  before_action :set_assignment

  def show
    @submission = Submission.find(params[:id])
  end

  def update
    if @submission.update_attributes(submission_params)
      flash[:notice] = "Your grade has been submitted."
    else
      flash.now[:alert] = "There was an error submitting your grade."
    end
    redirect_to @assignment
  end

  private
   def authenticate_instructor
     raise "You're not allowed!" unless current_instructor?
   end

   def set_assignment
     @assignment = Assignment.find(:assignment_id)
   end

   def submission_params
     params.require(:submission).permit(:grade)
   end
end
