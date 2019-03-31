class Marker < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :activity, as: :activitable, dependent: :destroy
  after_create :create_activities
  enum type: {favorite: 1, readed: 2, reading: 3, purchase_request: 4,
              rate_and_review: 5}

  private

  def create_activities
    Activity.create activitable: self, user: user
  end
end
