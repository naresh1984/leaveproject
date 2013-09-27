class CreateAdminLocations < ActiveRecord::Migration
  def change
    create_table :admin_locations do |t|
      t.string :title

      t.timestamps
    end
  end
end
