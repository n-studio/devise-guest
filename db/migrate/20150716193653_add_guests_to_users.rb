class AddGuestsToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :owner_user, index: true
    add_column :users, :guest, :boolean, default: false
  end
end
