class AddValueToHeaderables < ActiveRecord::Migration
  def change
    add_column :headerables, :value, :string
  end
end
