# == Schema Information
#
# Table name: shortened_urls
#
#  id           :integer          not null, primary key
#  short_url    :string           not null
#  long_url     :string           not null
#  submitter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#


class ShortenedUrl < ApplicationRecord
  # validates :short_url, uniqueness: true, presence: true
  # validates :submitter_id, presence: true
  def self.random_code
    p SecureRandom.urlsafe_base64
  end

  def self.shorten_url(submitter, input_url)
    key_url = ShortenedUrl.random_code
    ShortenedUrl.create!(long_url: input_url, short_url: key_url, submitter_id: submitter.id)
  end

  def num_clicks
    visitors.length
  end

  def num_uniques
    arr = []
    visitors.each do |visitor|
      arr << visitor.id unless arr.include?(visitor.id)
    end
    arr.length
  end

  def num_recent_uniques
    arr = []
    visitors.each do |visitor|
      arr << visitor.id unless arr.include?(visitor.id) || visitor.created_at < Time.now.to_date
    end
    arr.length
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
  through: :visits,
  source: :visitor

  has_many :taggings,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Tagging

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

end
