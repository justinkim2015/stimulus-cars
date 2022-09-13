class AddReferenceToVariant < ActiveRecord::Migration[7.0]
  def change
    add_reference :variants, :car
  end
end
