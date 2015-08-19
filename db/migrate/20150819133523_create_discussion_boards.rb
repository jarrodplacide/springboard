class CreateDiscussionBoards < ActiveRecord::Migration
  def change
    create_table :discussion_boards do |t|
      t.integer :section_id
      t.boolean :available_to_students

      t.timestamps null: false
    end
  end
end
