# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts 'Deleting Database...'



Appointment.destroy_all
Pet.destroy_all
Clinic.destroy_all
Tutor.destroy_all
User.destroy_all

puts 'Creating Users...'
roberto = User.new(email: "roberto@tutor.com", password:'roberto123', role: 'tutor')
roberto.save!

yuri = User.new(email: "yuri@clinic.com", password:'yuri123', role: 'clinic')
yuri.save!

miguel = User.new(email: "miguel@tutor.com", password:'miguel123', role: 'tutor')
miguel.save!

sakura = User.new(email: "sakura@clinic.com", password:'sakura123', role: 'clinic')
sakura.save!

andre = User.new(email: "andre@clinic.com", password:'andre123', role: 'clinic')
andre.save!

carla = User.new(email: "carla@clinic.com", password:'carla123', role: 'clinic' )
carla.save!

puts 'Creating Tutors...'

roberto_tutor = Tutor.new(fullname: 'Roberto', address: 'São Conrado', user_id: roberto.id)
roberto_tutor.save!

miguel_tutor = Tutor.new(fullname: 'Miguel', address: 'Ipanema', user_id: miguel.id)
miguel_tutor.save!

puts 'Creating Clinics...'

yuri_clinic = Clinic.new(cnpj: '12345678909876', company_name: 'Yuri\'s clinic', address: 'Barra da Tijuca', user_id: yuri.id)
yuri_clinic.save!

sakura_clinic = Clinic.new(cnpj: '73849987637382', company_name: 'Pet Stop', address: 'Botafogo', user_id: sakura.id)
sakura_clinic.save!

andre_clinic = Clinic.new(cnpj: '73267482190234', company_name: 'Animal Hospital', address: 'Copacabana', user_id: andre.id)
andre_clinic.save!

carla_clinic = Clinic.new(cnpj: '84766375890900', company_name: 'Vets R Us', address: 'Ipanema', user_id: carla.id)
carla_clinic.save!

puts 'Creating pets...'

tobias = Pet.new(name: 'Tobias', species: 'cat', breed: 'siamese', birth: Date.today - 800, tutor_id: miguel_tutor.id)
tobias.save!

figaro = Pet.new(name: 'Figaro', species: 'cat', breed: 'white', birth: Date.today - 100, tutor_id: roberto_tutor.id)
figaro.save!

lupo = Pet.new(name: 'Lupo', species: 'dog', breed: 'galgo', birth: Date.today - 500, tutor_id: roberto_tutor.id)
lupo.save!






puts 'Finished!'
