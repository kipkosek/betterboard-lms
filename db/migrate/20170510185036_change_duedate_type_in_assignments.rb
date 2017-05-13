class ChangeDuedateTypeInAssignments < ActiveRecord::Migration[5.0]
  def change
    change_column :assignments, :duedate, :datetime
  end
end
