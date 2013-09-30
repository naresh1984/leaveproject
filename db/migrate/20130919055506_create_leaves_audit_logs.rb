class CreateLeavesAuditLogs < ActiveRecord::Migration
  def change
    create_table :leaves_audit_logs do |t|
      t.integer :employee_id
      t.float :preels , :default => 0
      t.float :prenels , :default => 0
      t.float :prelops , :default => 0
      t.float :precompoffs , :default => 0
      t.float :currentels , :default => 0
      t.float :currentnels , :default => 0
      t.float :currentlops , :default => 0
      t.float :currentcompoffs , :default => 0
      t.string :tableorscreen
      t.integer :tableid
      t.integer :premodifiedby
      t.integer :recentmodifiedby

      t.timestamps
    end
  end
end
