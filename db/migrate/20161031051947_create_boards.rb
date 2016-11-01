class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.string :board_title

      t.timestamps null: false
    end
  end
end
