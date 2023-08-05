# frozen_string_literal: true

# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    username { Faker::Internet.username }
    level { User.levels.keys.sample }
    status { User.statuses.keys.sample }
    online { Faker::Boolean.boolean }
  end
end
