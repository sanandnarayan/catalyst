class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.integer :project_id
      t.datetime :start
      t.datetime :finish

      t.timestamps
    end
  end
end
