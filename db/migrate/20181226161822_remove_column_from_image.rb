class RemoveColumnFromImage < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :user_id, :string
    remove_column :images, :product_id, :string
  end
end
