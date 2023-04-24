class BlogPost < ApplicationRecord
  paginates_per 3

  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
end
