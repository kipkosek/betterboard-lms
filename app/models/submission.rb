class Submission < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :assignment
  belongs_to :student
  validates :assignment, presence: true
  validates :student, presence: true

  scope :ordered_by_assignment_duedate, -> { joins(:assignment).order('assignments.duedate ASC') }

end
