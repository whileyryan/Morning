class CreateReddits < ActiveRecord::Migration
  def change
    create_table :reddits do |t|
      t.string :title
      t.string :href
      t.string :domain
      t.string :time
      t.string :sub
      t.timestamps null: false
    end
  end
end
