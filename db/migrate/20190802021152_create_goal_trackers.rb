class CreateGoalTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_trackers do |t|
        t.belongs_to :goal, index: true
        t.datetime :occurrence_at
        t.timestamps
    end
  end
end
