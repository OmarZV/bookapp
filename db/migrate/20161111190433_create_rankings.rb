class CreateRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :rankings do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
