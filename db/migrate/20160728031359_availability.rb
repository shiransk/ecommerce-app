class Availability < ActiveRecord::Migration[5.0]
  def change
    add_column :products , :availability, :string
  end
end
