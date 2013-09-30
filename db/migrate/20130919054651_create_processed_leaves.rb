class CreateProcessedLeaves < ActiveRecord::Migration
  def change
    create_table :processed_leaves do |t|
      t.integer :leave_id
      t.float :els , :default => 0
      t.float :nels , :default => 0
      t.float :lops , :default => 0
      t.float :compoffs , :default => 0
      t.integer :processed_by

      t.timestamps
    end
  end
end
