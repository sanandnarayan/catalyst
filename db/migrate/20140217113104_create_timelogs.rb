class CreateTimelogs < ActiveRecord::Migration
  def change
    create_table :timelogs do |t|
      t.datetime :from
      t.datetime :to
      t.integer :task_id

      t.timestamps
    end
  end
end
