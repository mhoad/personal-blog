class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :category

  before_validation :check_facebook_description
  before_save :calculate_reading_time

  private

  def calculate_reading_time
    image_comprehension_time = 0.5 * calculate_image_count
    reading_comprehension_time = calculate_word_count / 275
    self.reading_time = (image_comprehension_time + reading_comprehension_time).ceil
  end

  def calculate_word_count
    html_free_post = ActionView::Base.full_sanitizer.sanitize(body).squish
    html_free_post.scan(/[\w-]+/).size
  end

  def calculate_image_count
    # Find how many images are there in the post content
    body.scan(/<img([\w\W]+?)>/).size
  end

  def check_facebook_description
    self.facebook_description = meta_description if facebook_description.blank?
  end
end
