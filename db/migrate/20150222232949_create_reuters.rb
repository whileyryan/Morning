class CreateReuters < ActiveRecord::Migration
  def change
    create_table :reuters do |t|
      t.string :title
      t.string :link
      t.timestamps null: false
    end
  end
end
