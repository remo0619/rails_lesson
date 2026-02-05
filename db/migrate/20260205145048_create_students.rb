class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
