class Person < ApplicationRecord
  has_many :animal , dependent: :destroy
  validates :name , uniqueness: true

  def age
    ((Time.zone.now - self.birth_date.to_time) / 1.year.seconds).floor
  end

  def total_mc
    self.animal.sum(:mc)
  end
end
