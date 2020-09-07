class Animal < ApplicationRecord
  belongs_to :person
  enum animal_type: [:cavalo , :cachorro , :papagaio, :lhama, :iguana, :ornitorrinco, :gato, :andorinha]
end
