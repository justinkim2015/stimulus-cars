class ChangeColumnNameCar < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :car, :name
  end
end
