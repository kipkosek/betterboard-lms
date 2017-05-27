class Assignment < ApplicationRecord
  has_many :submissions

  validates :name, presence: true
  validates :instructions, presence: true
  validates :duedate, presence: true

  scope :ordered_by_duedate, -> { order(duedate: :asc) }

end
