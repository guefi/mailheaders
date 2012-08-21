class CreateHeaderables < ActiveRecord::Migration
  def change
    create_table :headerables do |t|
      t.integer :email_id
      t.integer :header_id

      t.timestamps
    end
  end
end
