class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.text :note
      t.string :file
      t.integer :grade
      t.integer :assignment_id
      t.integer :student_id

      t.timestamps
    end
    add_index :submissions, :assignment_id
    add_index :submissions, :student_id
  end
end
