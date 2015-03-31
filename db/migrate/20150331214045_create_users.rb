class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :surname
      t.string :given_name
      t.string :username
      t.string :nickname
      t.string :phone
      t.string :email
      t.datetime :birthday
      t.boolean :active

      t.timestamps null: false
    end
  end
end
