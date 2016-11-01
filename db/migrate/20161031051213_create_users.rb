class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.string :email
      t.string :name

      t.timestamps null: false
    end
  end
end
