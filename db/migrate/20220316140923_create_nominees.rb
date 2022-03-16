class CreateNominees < ActiveRecord::Migration[6.1]
  def change
    create_table :nominees do |t|
      t.integer :user_id
      t.integer :nominee_id
      t.integer :weightage

      t.timestamps
    end
  end
end
