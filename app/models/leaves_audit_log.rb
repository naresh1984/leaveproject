class LeavesAuditLog < ActiveRecord::Base
  attr_accessible :currentcompoffs, :currentels, :currentlops, :currentnels, :employee_id, :precompoffs, :preels, :prelops, :premodifiedby, :prenels, :recentmodifiedby, :tableid, :tableorscreen
end
