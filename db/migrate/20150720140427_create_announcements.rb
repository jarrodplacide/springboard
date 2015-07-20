class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :section_id
      t.text :content

      t.timestamps null: false
    end
  end
end
