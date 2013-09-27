class CreateAdminHighScores < ActiveRecord::Migration
  def change
    create_table :admin_high_scores do |t|
      t.string :game
      t.integer :score

      t.timestamps
    end
  end
end
