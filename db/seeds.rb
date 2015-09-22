# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#--begin
User.create!(nombre:  "Juan",
             apellido: "Perez",
             correo: "admin@taxixpress.com",
             password:              "admin01",
             password_confirmation: "admin01",
             admin: true)
# Creando Clientes
3.times do |n|
  name  = Faker::Name.name
  last = Faker::Lorem.word
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(nombre:  name,
               apellido: last,
               correo: email,
               password:              password,
               password_confirmation: password)
end
# Creando Choferes
3.times do |n|
  name  = Faker::Name.name
  last = Faker::Lorem.word
  email = "chofer-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(nombre:  name,
               apellido: last,
               correo: email,
               password:              password,
               password_confirmation: password,
               driver: true,
               active: false)
end

# Creando Servicios Pendientes de Atencion
3.times do |i|
  3.times do
    from = Faker::Address.street_address
    to = Faker::Address.street_address
    sdate = Faker::Date.between(10.days.ago, Date.today)
    stime = Time.new.getlocal
    passengers = Random.rand(3) + 1
    payment = Faker::Lorem.word
    tipo = Faker::Name.last_name
    Service.create!(addr_from:  from,
                 addr_to: to,
                 date: sdate,
                 time: stime,
                 num_passengers: passengers,
                 payment_method: payment,
                 type_vehicle: tipo,
                 status: "Pendiente",
                 user: User.find(i + 1))
  end
end
