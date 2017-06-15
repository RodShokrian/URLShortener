# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topic      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagTopic < ApplicationRecord

  def popular_links
    url_arr = []
    urls.each do |url|
      url_arr << [url.long_url, url.num_clicks]
    end
    url_arr.sort {|x, y| x[1]<=>y[1]}.slice(-5..-1)
  end

  has_many :taggings,
    primary_key: :id,
    foreign_key: :topic_id,
    class_name: :Tagging

  has_many :urls,
    through: :taggings,
    source: :url
end
