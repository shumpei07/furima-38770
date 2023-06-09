FactoryBot.define do
  factory :user do
    transient do
      person{ Gimei.name}
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { person.last }
    first_name            { person.first }
    last_name_kana        { person.last.katakana }
    first_name_kana       { person.first.katakana }
    birth_date            { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end