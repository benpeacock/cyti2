class AddUserToEvents < ActiveRecord::Migration
  def change
    add_column :events, :createdBy, :string
  end
end
