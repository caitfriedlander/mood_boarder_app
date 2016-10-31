class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :user_id
      t.string :image_ids
      t.string :board_title

      t.timestamps null: false
    end
  end
end
