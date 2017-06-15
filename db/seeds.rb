ActiveRecord::Base.transaction do

  User.destroy_all
  user1 = User.create!(email: "anything")
  user2 = User.create!(email: "something")

  ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create!(short_url: "anything2", long_url: "test", submitter_id: user1.id)

  TagTopic.destroy_all
  topic1 = TagTopic.create!(topic: "music")
  topic2 = TagTopic.create!(topic: "news")

  Tagging.destroy_all
  Tagging.create!(topic_id: topic1.id, url_id: url1.id)
  Tagging.create!(topic_id: topic2.id, url_id: url1.id)


end
