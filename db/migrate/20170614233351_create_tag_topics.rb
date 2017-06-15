class CreateTagTopics < ActiveRecord::Migration[5.0]
  def change
    topic_arr = ["news", "music", "sports"]
    create_table :tag_topics do |t|
      # if topic_arr.include?(t)
        t.string :topic, unique: true
      # end
      t.timestamps
    end
    add_index :tag_topics, :topic, unique: true
  end
end
