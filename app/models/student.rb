class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  has_many :assignments, through: :submissions

  def submission_for(assignment)
    submissions.find_by(assignment_id: assignment.id)
  end
end
