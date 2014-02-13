class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :name
      t.belongs_to :project

      t.timestamps
    end
  end
end
