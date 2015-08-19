class CreateTopicThreads < ActiveRecord::Migration
  def change
    create_table :topic_threads do |t|
      t.integer :board_topic_id
      t.string :title
      t.integer :user_id
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
