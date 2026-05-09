class Goal < ApplicationRecord
  belongs_to :user
  has_many :todos, -> { order("done ASC, position ASC").includes(:goal) }, dependent: :destroy

  validation :title, presence: true
end