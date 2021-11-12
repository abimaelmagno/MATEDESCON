# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing users database..."
User.destroy_all
puts "Products database has been successfully cleared."


puts "Clearing users database..."
Firma.destroy_all
puts "Products database has been successfully cleared."

puts "Clearning fornecedores database..."
Fornecedor.destroy_all
puts "Fornecedoress database has been successfully cleared."

puts "Seeding Users database..."
5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    course: Faker::Educator.course_name,
    period: rand(1..10),
    email: Faker::Internet.email,
    password: "123123"
  )
end
puts "10 users have been created."


puts "Seeding Firmas database..."
10.times do
  Firma.create!(
    name: Faker::Company.name,
    sector: ["Vestuário", "Alimentação", "brinquedo"].sample,
    user_id: User.all.sample.id
  )
end
puts "15 firmass have been created."


puts "Seeding Fornecedores database..."
100.times do
  Fornecedor.create!(
    name: Faker::Company.industry,
    name_produto: ["roupa", "quentinha", "brinquedo"].sample,
    preco: rand(50..100),
    estoque: rand(100..1000),
    prazo: rand(1..3),
    firma_id: Firma.all.sample.id
  )
end
puts "30 products have been successfully created."