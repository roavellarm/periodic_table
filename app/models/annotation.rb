class Annotation < ApplicationRecord
  belongs_to :element
  validates :content, presence: true
end
