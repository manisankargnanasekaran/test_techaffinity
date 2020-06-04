class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :mark
      t.references :student, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
