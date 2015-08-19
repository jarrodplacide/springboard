class CreateBoardTopics < ActiveRecord::Migration
  def change
    create_table :board_topics do |t|
      t.integer :discussion_board_id
      t.string :name
      t.integer :rank

      t.timestamps null: false
    end
  end
end
