class Assignment < ApplicationRecord
  has_many :submissions

  scope :ordered_by_duedate, -> { order(duedate: :asc) }

end
