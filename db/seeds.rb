# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ProblemSet.create(name: "Beginner", complexity: 0)
ProblemSet.create(name: "intermediate", complexity: 1)
ProblemSet.create(name: "advanced", complexity: 2)
ProblemSet.create(name: "expert", complexity: 3)

Problem.create(
  description: "What does the `rails new` command do?",
  points: 10,
  problem_set_id: 1,
  choices: ["Starts the rails server", "Creates a new Rails application", "Creates a new table in database", "Updates the Rails version"],
  answer: "Creates a new Rails application"
)

Problem.create(
  description: "The 'MVC' in Rails stands for?",
  points: 10,
  problem_set_id: 1,
  choices: ["Model View Controller", "Maximum Velocity Curve", "Minimum Viable Candidate", "Model View Candidate"],
  answer: "Model View Controller"
)

Problem.create(
  description: "What command do you use to start the Rails server?",
  points: 10,
  problem_set_id: 1,
  choices: ["rails s", "rails start", "rails server", "All of the above"],
  answer: "All of the above"
)

Problem.create(
  description: "What is ActiveRecord in Rails?",
  points: 10,
  problem_set_id: 1,
  choices: ["A Ruby library", "The M in MVC", "A database", "None of the above"],
  answer: "The M in MVC"
)

Problem.create(
  description: "What does CRUD stand for?",
  points: 10,
  problem_set_id: 1,
  choices: ["Create, Read, Update, Delete", "Compact, Roll, Upgrade, Delete", "Create, Roll, Upgrade, Delete", "None of the above"],
  answer: "Create, Read, Update, Delete"
)

Problem.create(
  description: "What does the has_many attribute do in Rails models?",
  points: 20,
  problem_set_id: 2,
  choices: ["Specifies a one-to-one relationship", "Specifies a one-to-many relationship", "Specifies a many-to-many relationship", "None of the above"],
  answer: "Specifies a one-to-many relationship"
)

Problem.create(
  description: "What is scaffolding in Rails?",
  points: 20,
  problem_set_id: 2,
  choices: ["A technique to create views", "A feature to generate boilerplate code", "A method to style your app", "A way to deploy your app"],
  answer: "A feature to generate boilerplate code"
)

Problem.create(
  description: "How do you reverse a migration in Rails?",
  points: 20,
  problem_set_id: 2,
  choices: ["rails db:rollback", "migration:rollback", "rails migration:undo", "None of the above"],
  answer: "rails db:rollback"
)

Problem.create(
  description: "Which method will run any code that needs to be executed after saving an instance of a model?",
  points: 20,
  problem_set_id: 2,
  choices: %w[after_save before_save after_open before_open],
  answer: "after_save"
)

Problem.create(
  description: "What is a Gemfile in Rails?",
  points: 20,
  problem_set_id: 2,
  choices: ["A file containing details of gems in the project", "A gem that is used to organize other gems", "A file that documents the codebase", "None of the above"],
  answer: "A file containing details of gems in the project"
)

Problem.create(
  description: "What is a secure way to store sensitive information like passwords in Rails?",
  points: 30,
  problem_set_id: 3,
  choices: ["Rails Secrets", "Store as plain text in database", "Store in the Rails environment", "All of the above"],
  answer: "Rails Secrets"
)

Problem.create(
  description: "What is the difference between `render` and `redirect_to` in Rails?",
  points: 30,
  problem_set_id: 3,
  choices: ["No difference", "`render` renders a view, `redirect_to` redirects to a new URL", "`render` displays a flash message, `redirect_to` does not", "`redirect_to` renders a view, `render` redirects to a new URL"],
  answer: "`render` renders a view, `redirect_to` redirects to a new URL"
)

Problem.create(
  description: "How can you speed up asset compilation in Rails?",
  points: 30,
  problem_set_id: 3,
  choices: ["By using turbo links", "By precompiling assets", "By reducing the size of assets", "All of the above"],
  answer: "All of the above"
)

Problem.create(
  description: "What is the purpose of the `respond_to` method in Rails controllers?",
  points: 30,
  problem_set_id: 3,
  choices: ["To define the HTTP response format", "To respond to user inputs", "To handle exceptions", "None of the above"],
  answer: "To define the HTTP response format"
)

Problem.create(
  description: "In Rails, how do you specify that an action should run before others in a controller?",
  points: 30,
  problem_set_id: 3,
  choices: ["By using the `before_action` filter", "By using the `action` method", "By writing the action at the top of the controller", "None of the above"],
  answer: "By using the `before_action` filter"
)

Problem.create(
  description: "How do you deal with N+1 queries problem in Rails?",
  points: 40,
  problem_set_id: 4,
  choices: ["Using .include(:association)", "Using .preload(:association)", "Using .eager_load(:association)", "All of the above"],
  answer: "All of the above"
)

Problem.create(
  description: "How do you use custom SQL queries in ActiveRecord?",
  points: 40,
  problem_set_id: 4,
  choices: %w[Model.find_by_sql Model.custom_query ActiveRecord::Base.execute Model.sql_query],
  answer: "Model.find_by_sql"
)

Problem.create(
  description: "What is eager loading and when would you use it?",
  points: 40,
  problem_set_id: 4,
  choices: ["It loads all records from a database table into memory, used to improve query performance.", "It is the process of loading associated records, used when you need to load many records at once.", "It is the process of retrieving database records in batches, used to optimize memory usage.", "None of the above."],
  answer: "It is the process of loading associated records, used when you need to load many records at once."
)

Problem.create(
  description: "How do you handle exceptions that might occur during database transactions in Rails?",
  points: 40,
  problem_set_id: 4,
  choices: ["Using rescue from ActiveRecord::Rollback", "Using begin...rescue...end block", "Using the rescue method", "All of the above"],
  answer: "Using begin...rescue...end block"
)

Problem.create(
  description: "How can you add real-time features to a Rails application?",
  points: 40,
  problem_set_id: 4,
  choices: ["By using ActionCable", "By using WebSockets", "By using the event-stream protocol", "All of the above"],
  answer: "All of the above"
)