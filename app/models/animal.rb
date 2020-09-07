class Animal < ApplicationRecord
  belongs_to :person
  enum animal_type: [:cavalo , :cachorro , :papagaio, :lhama, :iguana, :ornitorrinco, :gato, :andorinha]
  validates :person_id , presence: true
  validates :person_age , numericality: {greater_than_or_equal_to: 18}, on: :create , if: :swallow_type?

  def swallow_type?
    self.animal_type == "andorinha"
  end

  def person_age
    ((Time.zone.now - self.person.birth_date.to_time) / 1.year.seconds).floor
  end

end
