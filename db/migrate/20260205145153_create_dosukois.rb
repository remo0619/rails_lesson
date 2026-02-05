class CreateDosukois < ActiveRecord::Migration[7.2]
  def change
    create_table :dosukois do |t|
      t.string :shikona
      t.string :room

      t.timestamps
    end
  end
end
