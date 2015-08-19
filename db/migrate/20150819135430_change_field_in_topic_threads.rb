class ChangeFieldInTopicThreads < ActiveRecord::Migration
  def change
    rename_column :topic_threads, :user_id, :student_id
  end
end
