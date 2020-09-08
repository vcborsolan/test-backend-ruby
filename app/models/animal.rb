class Animal < ApplicationRecord
  belongs_to :person
  enum animal_type: [:cavalo , :cachorro , :papagaio, :lhama, :iguana, :ornitorrinco, :gato, :andorinha]
  validates :person_id , presence: true
  validates :person_age , numericality: {greater_than_or_equal_to: 18}, on: :create , if: :swallow_type?
  validates :person_name, format: { without: /\A[Aa]{1}/,message: "People cannot adopt cats if the first letter of the name is A"} , on: :create, if: :cat_type?
  validates :person_mc, numericality: {less_than: 1000 , message: "People cannot adopt animals when total monthly cost is bigger than 1000"}, on: :create

  def swallow_type?
    self.animal_type == "andorinha"
  end

  def cat_type?
    self.animal_type == "gato"
  end

  def person_age
    self.person.age
  end

  def person_name
    self.person.name
  end

  def person_mc
    self.person.total_mc
  end

end
