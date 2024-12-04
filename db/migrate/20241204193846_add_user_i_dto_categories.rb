class AddUserIDtoCategories < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :user_id, :integer
  end
end
