class AddColumnToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :product, foreign_key: true
  end
end
