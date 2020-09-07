# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = [
    {name: 'Johnny Cash',document: '555555555',birth_date: '26/02/1932'},
    {name: 'Sid Vicious',document: '555555555',birth_date: '10/05/1957'},
    {name: 'Axl Rose',document: '555555555',birth_date: '06/02/1962'},
    {name: 'Joey Ramone',document: '555555555',birth_date: '19/05/1951'},
    {name: 'Bruce Dickinson',document: '555555555',birth_date: '07/08/1958'},
    {name: 'Kurt Cobain',document: '555555555',birth_date: '20/02/1967'},
    {name: 'Elvis Presley',document: '555555555',birth_date: '17/08/2008'}    
]

people.each do |person|
    Person.create(person)
end

animals = [
    {name: 'Pé de Pano', mc: 199.99, animal_type: 0, person_id: '1'},
    {name: 'Rex', mc: 99.99, animal_type: 1, person_id: '2'},
    {name: 'Ajudante do Papai Noel', mc: 99.99, animal_type: 1, person_id: '3'},
    {name: 'Rex', mc: 103.99, animal_type: 2, person_id: '4'},
    {name: 'Flora', mc: 103.99, animal_type: 3, person_id: '5'},
    {name: 'Dino', mc: 177.99, animal_type: 4, person_id: '6'},
    {name: 'Lassie', mc: 407.99, animal_type: 5, person_id: '7'}
]
animals.each do |animal|
    Animal.create(animal)
end