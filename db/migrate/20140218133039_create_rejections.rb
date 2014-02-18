class CreateRejections < ActiveRecord::Migration
  def change
    create_table :rejections do |t|
      t.integer :story_id
      t.text :reason

      t.timestamps
    end
  end
end
