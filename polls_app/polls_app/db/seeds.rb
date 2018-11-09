# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Response.destroy_all
AnswerChoice.destroy_all
Question.destroy_all
Poll.destroy_all
User.destroy_all

users = []
5.times do
  users << User.create!(username: Faker::AquaTeenHungerForce.character)
end

polls = []
users.each do |user|
  polls << Poll.create!(user_id: user.id, title: Faker::GameOfThrones.quote)
end

questions = []
polls.each do |poll|
  questions << Question.create!(poll_id: poll.id, body: Faker::DumbAndDumber.quote)
end

answer_choices = []
questions.each do |question|
  4.times { answer_choices << AnswerChoice.create!(question_id: question.id, answer_choice: Faker::ChuckNorris.fact) }
end
