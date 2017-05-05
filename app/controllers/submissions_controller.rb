class SubmissionsController < ApplicationController

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.build(submission_params)
    @submission.student = current_student

    if @submission.save
      flash[:notice] = "Your assignment has been submitted."
      redirect_to assignments_path
    else
      flash.now[:alert] = "There was an error submitting the assignment. Please try again."
      render :new
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.assign_attributes(submission_params)

    if @submission.save
      flash[:notice] = "Your assignment was updated."
      redirect_to assignments_path
    else
      flash.now[:alert] = "There was an error updating the assignment. Please try again."
      render :edit
    end
  end

  def destroy
    @submission = Submission.find(params[:id])

    if @submission.destroy
      flash[:notice] = "Your submission was deleted."
      redirect_to student_path
    else
      flash.now[:alert] = "There was an error deleting the submission."
      redirect_to student_path
    end
  end


  private

  def submission_params
    params.require(:submission).permit(:note, :file, :file_cache)
  end
end
