class CreateThreadPosts < ActiveRecord::Migration
  def change
    create_table :thread_posts do |t|
      t.integer :thread_id
      t.text :content
      t.integer :student_id
      t.integer :instructor_id

      t.timestamps null: false
    end
  end
end
