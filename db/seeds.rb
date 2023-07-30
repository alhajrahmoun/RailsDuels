# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(
  email: "test1@test.com",
  username: "user1",
  password: "123456",
  level: :intermediate
)

User.create(
  email: "test2@test.com",
  username: "user2",
  password: "123456",
  level: :intermediate
)


problem1 = Problem.create(
  description: "What is the name of the Rails command to create a new Rails application?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails new"
)

problem2 = Problem.create(
  description: "What is the name of the Rails command to create a new controller?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails generate"
)

problem3 = Problem.create(
  description: "What is the name of the Rails command to create a new model?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails generate"
)

problem4 = Problem.create(
  description: "What is the name of the Rails command to create a new scaffold?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails generate"
)

problem5 = Problem.create(
  description: "What is the name of the Rails command to create a new migration?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails generate"
)

problem6 = Problem.create(
  description: "What is the name of the Rails command to create a new migration?",
  points: 1,
  complexity: 1,
  choices: ["rails new", "rails create", "rails generate", "rails app"],
  answer: "rails generate"
)

problem7 = Problem.create(
  description: "What is the name of the Rails command to run a migration?",
  points: 1,
  complexity: 1,
  choices: ["rails run", "rails migrate", "rails up", "rails do"],
  answer: "rails migrate"
)

problem8 = Problem.create(
  description: "Which of the following is the correct syntax for the 'belongs_to' association?",
  points: 2,
  complexity: 2,
  choices: ["belongs_to :user", "belongs_to user", "belongs_to(user)", "belongs_to user_id"],
  answer: "belongs_to :user"
)

problem9 = Problem.create(
  description: "Which of the following is the correct syntax for the 'has_many' association?",
  points: 2,
  complexity: 2,
  choices: ["has_many :users", "has_many users", "has_many(users)", "has_many user_ids"],
  answer: "has_many :users"
)

problem10 = Problem.create(
  description: "Which of the following is the correct syntax for the 'has_one' association?",
  points: 2,
  complexity: 2,
  choices: ["has_one :user", "has_one user", "has_one(user)", "has_one user_id"],
  answer: "has_one :user"
)

problem11 = Problem.create(
  description: "Which of the following is the correct syntax for the 'has_and_belongs_to_many' association?",
  points: 2,
  complexity: 2,
  choices: ["has_and_belongs_to_many :users", "has_and_belongs_to_many users", "has_and_belongs_to_many(users)", "has_and_belongs_to_many user_ids"],
  answer: "has_and_belongs_to_many :users"
)

problem12 = Problem.create(
  description: "Which of the following is the correct syntax for the 'has_many :through' association?",
  points: 2,
  complexity: 2,
  choices: ["has_many :users, through: :user_id", "has_many :users, through: :user", "has_many :users, :through => :user_id", "has_many :users, :through => :user"],
  answer: "has_many :users, through: :user"
)

problem13 = Problem.create(
  description: "Which of the following is the correct syntax for the 'has_one :through' association?",
  points: 2,
  complexity: 2,
  choices: ["has_one :user, through: :user_id", "has_one :user, through: :user", "has_one :user, :through => :user_id", "has_one :user, :through => :user"],
  answer: "has_one :user, through: :user"
)
# create problems with higher complexity

problem14 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :destroy' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :destroy", "dependent => :destroy", "dependent: destroy", "dependent => destroy"],
  answer: "dependent: :destroy"
)

problem15 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :delete_all' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :delete_all", "dependent => :delete_all", "dependent: delete_all", "dependent => delete_all"],
  answer: "dependent: :delete_all"
)

problem16 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :nullify' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :nullify", "dependent => :nullify", "dependent: nullify", "dependent => nullify"],
  answer: "dependent: :nullify"
)

problem17 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :restrict_with_exception' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :restrict_with_exception", "dependent => :restrict_with_exception", "dependent: restrict_with_exception", "dependent => restrict_with_exception"],
  answer: "dependent: :restrict_with_exception"
)

problem18 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :restrict_with_error' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :restrict_with_error", "dependent => :restrict_with_error", "dependent: restrict_with_error", "dependent => restrict_with_error"],
  answer: "dependent: :restrict_with_error"
)

problem19 = Problem.create(
  description: "Which of the following is the correct syntax for the 'dependent: :nullify' option?",
  points: 3,
  complexity: 3,
  choices: ["dependent: :nullify", "dependent => :nullify", "dependent: nullify", "dependent => nullify"],
  answer: "dependent: :nullify"
)