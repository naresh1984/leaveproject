class ProcessedLeave < ActiveRecord::Base
  attr_accessible :compoffs, :els, :leave_id, :lops, :nels, :processed_by

   belongs_to :leave_request


  def self.els_count
    sum(:els)
  end

  def self.nels_count
    sum(:nels)
  end

  def self.lops_count
    sum(:lops)
  end

  def self.compoffs_count
    sum(:compoffs)
  end
 
end
