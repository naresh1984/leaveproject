class Admin::HighScore < ActiveRecord::Base
  attr_accessible :game, :score
end
