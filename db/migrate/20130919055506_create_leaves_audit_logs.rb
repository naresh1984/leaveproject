class CreateLeavesAuditLogs < ActiveRecord::Migration
  def change
    create_table :leaves_audit_logs do |t|
      t.integer :employee_id
      t.float :preels
      t.float :prenels
      t.float :prelops
      t.float :precompoffs
      t.float :currentels
      t.float :currentnels
      t.float :currentlops
      t.float :currentcompoffs
      t.string :tableorscreen
      t.integer :tableid
      t.integer :premodifiedby
      t.integer :recentmodifiedby

      t.timestamps
    end
  end
end
