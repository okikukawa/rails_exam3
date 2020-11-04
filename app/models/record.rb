class Record < ApplicationRecord
  validates :content, presence: true
end
