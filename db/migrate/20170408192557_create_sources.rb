class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.text :description
      t.string :file
      t.string :link
      t.string :youtube

      t.timestamps
    end
  end
end
