
[Como instalar](#como-instalar)
[Desafio](#desafio)
[Respostas](#respostas)

# O que é este projeto?

Este projeto tem como finalidade , solucionar um teste tecnico para vaga de back-end ruby.

## Como instalar?

    1. Clonar o projeto:

        ```bash
            $ git clone  https://github.com/vcborsolan/test-backend-ruby.git
        ```

    2. Criar o database(SQLite):

        ```ruby
            $ rails db:create
        ```
    3. Migrar o banco:

        ```ruby
            $ rails db:migrate
        ```

    4. Seedar o banco:

        ```ruby
            $ rails db:seed
        ```

## Desafio

O objetivo deste exercício é analisar sua familiaridade com a plataforma Rails,
atendendo um caso de uso com os recursos de modelagem e validação que o framework oferece.
Por favor, tente resolver o teste sem ajuda de ninguém. Lembre-se de que discutiremos a
solução pessoalmente.

Boa sorte e obrigado por participar!

### Cenário: Você precisa escrever uma aplicação para gestão de animais.

  - Pessoas tem animais, e animais tem tipos.
  - Uma pessoa tem os atributos nome, documento e data de nascimento.
  - Um animal tem  os atributos nome, custo mensal e tipo.

## Regras

  - Pessoas podem ter vários animais
  - Pessoas devem ter mais de 18 anos para ter andorinhas
  - Pessoas que tenham nome começando com a letra "A" não podem ter animais do tipo Gato
  - Pessoas que já tiverem custos com animais acima de 1000 não podem ter mais animais

## Informações para popular o sistema

Crie um seed para popular o banco de dados de acordo com os dados abaixo:

### Pessoas

| NOME            | DOCUMENTO | DATA DE NASCIMENTO       |
|-----------------|-----------|--------------------------|
| Johnny Cash     | 555555555 | 26 de fevereiro de 1932  |
| Sid Vicious     | 555555555 | 10 de maio de 1957       |
| Axl Rose        | 555555555 | 6 de fevereiro de 1962   |
| Joey Ramone     | 555555555 | 19 de maio de 1951       |
| Bruce Dickinson | 555555555 | 7 de agosto de 1958      |
| Kurt Cobain     | 555555555 | 20 de fevereiro de 1967  |
| Elvis Presley   | 555555555 | 17 de agosto de 2008     |

### Animais

| NOME                   | CUSTO MENSAL | TIPO         | DONO            |
|------------------------|--------------|--------------|-----------------|
| Pé de Pano             |  199,99      | Cavalo       | Jhonny Cash     |
| Rex                    |  99,99       | Cachorro     | Sid Vicious     |
| Ajudante do Papai Noel |  99,99       | Cachorro     | Axl Rose        |
| Rex                    |  103,99      | Papagaio     | Joey Ramone     |
| Flora                  |  103,99      | Lhama        | Bruce Dickinson |
| Dino                   |  177,99      | Iguana       | Kurt Cobain     |
| Lassie                 |  407,99      | Ornitorrinco | Elvis Presley   |

## Respostas

    - Qual é o custo médio dos animais do tipo cachorro?

    ```ruby
        Animal.where(animal_type: 'cachorro').average(:mc).to_f
    ```

    - Quantos cachorros existem no sistema?

    ```ruby
        Animal.where(animal_type: 'cachorro').count()
    ```

    - Qual o nome dos donos dos cachorros? (Array de nomes)

    ```ruby
        Animal.includes(:person).where(animal_type: 'cachorro').map {|animal| animal.person.name}
    ```

    - Retorne as pessoas ordenando pelo custo que elas tem com os animais (Maior para menor)

    ```ruby
        Person.includes(:animal).group('name').sum(:mc).sort_by {|k,v| -v}
    ```
    
    - Levando em consideração o custo mensal, qual será o custo de 3 meses de cada pessoa?

    ```ruby
        Person.includes(:animal).group('name').sum(:mc).map {|k,v| [k ,(v*3).round(2)]}
    ```