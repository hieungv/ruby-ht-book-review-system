class Book < ApplicationRecord
  belongs_to :category
  has_many :markers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, length: {maximum: Settings.string_maximum}, presence: true
  validates :description, presence: true
  validate :min_publish_date, :max_publish_date
  validates :number_pages, presence: true
  validates :price, presence: true
  validates :author, length: {maximum: Settings.name_maximum}, presence: true

  private

  def min_publish_date
    return unless publish_date <= Settings.min_date
    errors.add :publish_date, I18n.t("activerecord.min_date",
      date: Settings.min_date.strftime("%d/%m/%Y"))
  end

  def max_publish_date
    return unless publish_date >= Settings.max_date
    errors.add :publish_date, I18n.t("activerecord.max_date",
      date: Settings.max_date.strftime("%d/%m/%Y"))
  end
end
