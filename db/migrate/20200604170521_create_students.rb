class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :roll_no
      t.integer :total

      t.timestamps
    end
  end
end
