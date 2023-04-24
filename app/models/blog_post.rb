class BlogPost < ApplicationRecord
  belongs_to :user
  
  paginates_per 3

  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
end
