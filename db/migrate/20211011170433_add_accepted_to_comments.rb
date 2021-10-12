class AddAcceptedToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :accepted, :boolean, default: false
  end
end
