class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :emailVerified
      t.string :email
      t.string :zipcode

      t.timestamps
    end
  end
end
