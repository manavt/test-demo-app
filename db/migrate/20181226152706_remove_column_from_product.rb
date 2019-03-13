class RemoveColumnFromProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :product_id, :string
  end
end
