class CreateProcessedLeaves < ActiveRecord::Migration
  def change
    create_table :processed_leaves do |t|
      t.integer :leave_id
      t.float :els
      t.float :nels
      t.float :lops
      t.float :compoffs
      t.integer :processed_by

      t.timestamps
    end
  end
end
