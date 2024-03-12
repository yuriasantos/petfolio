# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'


puts 'Deleting Database...'



Appointment.destroy_all
Vet.destroy_all
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

fernando = User.new(email: 'fernando@vet.com', password:'fernando123', role: 'vet')
fernando.save!

puts 'Creating Tutors...'

file = URI.open('https://i.pinimg.com/originals/9f/74/53/9f74535608abc523efe3eb37a9a30a54.jpg')
roberto_tutor = Tutor.new(fullname: 'Roberto', address: 'São Conrado', user_id: roberto.id)
roberto_tutor.photo.attach(io: file, filename: "roberto_tutor.png", content_type: "image/png")
roberto_tutor.save!

file = URI.open('https://pikwizard.com/pw/small/2211301f64c30057c9d7a66a7f9d2e3b.jpg')
miguel_tutor = Tutor.new(fullname: 'Miguel', address: 'Ipanema', user_id: miguel.id)
miguel_tutor.photo.attach(io: file, filename: "miguel_tutor.png", content_type: "image/png")
miguel_tutor.save!

puts 'Creating Clinics...'

file = URI.open('https://img.freepik.com/premium-vector/veterinary-clinic-cartoon-advertisement_1284-65306.jpg')
yuri_clinic = Clinic.new(cnpj: '12345678909876', company_name: 'Yuri\'s clinic', address: 'Barra da Tijuca', user_id: yuri.id)
yuri_clinic.photo.attach(io: file, filename: "yuri_clinic.png", content_type: "image/png")
yuri_clinic.save!

file = URI.open('https://www.altaviewveterinaryclinic.com/wp-content/uploads/2021/09/240874373_4657460774297954_4936407023282923628_n.jpg')
sakura_clinic = Clinic.new(cnpj: '73849987637382', company_name: 'Pet Stop', address: 'Botafogo', user_id: sakura.id)
sakura_clinic.photo.attach(io: file, filename: "sakura_clinic.png", content_type: "image/png")
sakura_clinic.save!

file = URI.open('https://i.pinimg.com/474x/2c/aa/b4/2caab42aa4d42d80846d5fbb223498c7.jpg')
andre_clinic = Clinic.new(cnpj: '73267482190234', company_name: 'Animal Hospital', address: 'Copacabana', user_id: andre.id)
andre_clinic.photo.attach(io: file, filename: "andre_clinic.png", content_type: "image/png")
andre_clinic.save!

file = URI.open('https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2021/08/20-90670450-interior-design-for-pets-is-a-thing.jpg')
carla_clinic = Clinic.new(cnpj: '84766375890900', company_name: 'Vets R Us', address: 'Ipanema', user_id: carla.id)
carla_clinic.photo.attach(io: file, filename: "carla_clinic.png", content_type: "image/png")
carla_clinic.save!

puts 'Creating pets...'

file = URI.open('https://hips.hearstapps.com/hmg-prod/images/beautiful-smooth-haired-red-cat-lies-on-the-sofa-royalty-free-image-1678488026.jpg')
tobias = Pet.new(name: 'Tobias', species: 'cat', breed: 'siamese', birth: Date.today - 800, tutor_id: miguel_tutor.id)
tobias.photo.attach(io: file, filename: "tobias.png", content_type: "image/png")
tobias.save!

file = URI.open('https://wallpapers.com/images/hd/white-cat-pictures-9by3abhjt5r5wuxu.jpg')
figaro = Pet.new(name: 'Figaro', species: 'cat', breed: 'white', birth: Date.today - 100, tutor_id: roberto_tutor.id)
figaro.photo.attach(io: file, filename: "figaro.png", content_type: "image/png")
figaro.save!

file = URI.open('https://media-be.chewy.com/wp-content/uploads/2021/06/10162333/ItalianGreyhound-FeaturedImage-1024x615.jpg')
lupo = Pet.new(name: 'Lupo', species: 'dog', breed: 'galgo', birth: Date.today - 500, tutor_id: roberto_tutor.id)
lupo.photo.attach(io: file, filename: "lupo.png", content_type: "image/png")
lupo.save!

fernando_vet = Vet.new(fullname: 'Fernando da Silva', crmv: '39483743638', user_id: fernando.id, specialty: 'dermatology', clinic_id: andre_clinic.id)
fernando_vet.save!





puts 'Finished!'
