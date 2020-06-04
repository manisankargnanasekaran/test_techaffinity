class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :subject_name
      t.string :subject_code
      t.boolean :is_finished
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
