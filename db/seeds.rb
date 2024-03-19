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

Record.destroy_all
Review.destroy_all
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

sirene = User.new(email: 'sirene@vet.com', password:'sirene123', role: 'vet')
sirene.save!

pedro = User.new(email: 'pedro@clinic.com', password:'pedro123', role: 'clinic')
pedro.save!

sergio = User.new(email: 'sergio@clinic.com', password:'sergio123', role: 'clinic')
sergio.save!

andrea = User.new(email: 'andrea@clinic.com', password:'andrea123', role: 'clinic')
andrea.save!

chloe = User.new(email: 'chloe@clinic.com', password:'chloe123', role: 'clinic')
chloe.save!

rafael = User.new(email: 'rafael@clinic.com', password:'rafael123', role: 'clinic')
rafael.save!

rogerio = User.new(email: 'rogerio@vet.com', password:'rogerio123', role: 'vet')
rogerio.save!

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
yuri_clinic = Clinic.new(cnpj: '12345678909876', company_name: 'Yuri\'s clinic', address: 'Av Armando Lombardi, Barra da Tijuca', user_id: yuri.id)
yuri_clinic.photo.attach(io: file, filename: "yuri_clinic.png", content_type: "image/png")
yuri_clinic.save!

file = URI.open('https://www.altaviewveterinaryclinic.com/wp-content/uploads/2021/09/240874373_4657460774297954_4936407023282923628_n.jpg')
sakura_clinic = Clinic.new(cnpj: '73849987637382', company_name: 'Pet Stop', address: 'Rua Sao Clemente, Botafogo', user_id: sakura.id)
sakura_clinic.photo.attach(io: file, filename: "sakura_clinic.png", content_type: "image/png")
sakura_clinic.save!

file = URI.open('https://i.pinimg.com/474x/2c/aa/b4/2caab42aa4d42d80846d5fbb223498c7.jpg')
andre_clinic = Clinic.new(cnpj: '73267482190234', company_name: 'Animal Hospital', address: 'Av Epitacio Pessoa, Lagoa', user_id: andre.id)
andre_clinic.photo.attach(io: file, filename: "andre_clinic.png", content_type: "image/png")
andre_clinic.save!

file = URI.open('https://images.fastcompany.net/image/upload/w_596,c_limit,q_auto:best,f_auto/wp-cms/uploads/2021/08/20-90670450-interior-design-for-pets-is-a-thing.jpg')
carla_clinic = Clinic.new(cnpj: '84766375890900', company_name: 'Vets R Us', address: 'Rua Visconde de Piraja, Ipanema', user_id: carla.id)
carla_clinic.photo.attach(io: file, filename: "carla_clinic.png", content_type: "image/png")
carla_clinic.save!

file = URI.open('https://hospitalitydesign.com/wp-content/uploads/2021/01/modern-animal1.jpg')
pedro_clinic = Clinic.new(cnpj: '84766375890910', company_name: 'Curing Cats n Dogs', address: 'Rua Sousa Lima, 158 - Copacabana', user_id: pedro.id)
pedro_clinic.photo.attach(io: file, filename: "pedro_clinic.png", content_type: "image/png")
pedro_clinic.save!

file = URI.open('https://elitefitout.com.au/wp-content/uploads/2022/02/37_VSOS-8-1-2.jpg')
sergio_clinic = Clinic.new(cnpj: '84766375890948', company_name: 'Pet Zone', address: 'Av Atlantica, 208 - Copacabana', user_id: sergio.id)
sergio_clinic.photo.attach(io: file, filename: "sergio_clinic.png", content_type: "image/png")
sergio_clinic.save!

file = URI.open('https://f.hubspotusercontent00.net/hubfs/3818705/Smiling%20vet%20examining%20a%20dog%20in%20medical%20office-1.jpeg')
andrea_clinic = Clinic.new(cnpj: '84766885890910', company_name: 'Healthy Bones Co.', address: 'Rua Negreiros Lobato, Lagoa - RJ', user_id: andrea.id)
andrea_clinic.photo.attach(io: file, filename: "andrea_clinic.png", content_type: "image/png")
andrea_clinic.save!

file = URI.open('https://www.papayapet.com/wp-content/uploads/2024/01/papaya-encinitas-emergency-vet-clinic-960x1280.jpg')
chloe_clinic = Clinic.new(cnpj: '84766375890610', company_name: 'Meow Medical Center', address: 'Praca General Osorio, - Ipanema', user_id: chloe.id)
chloe_clinic.photo.attach(io: file, filename: "chloe_clinic.png", content_type: "image/png")
chloe_clinic.save!

file = URI.open('https://cottonwoodvc.com/wp-content/uploads/2023/02/Reception-1024x683.jpg')
rafael_clinic = Clinic.new(cnpj: '84766375890610', company_name: 'Clinicats', address: 'Parque dos Patins, Lagoa', user_id: rafael.id)
rafael_clinic.photo.attach(io: file, filename: "rafael_clinic.png", content_type: "image/png")
rafael_clinic.save!

puts 'Creating Pets...'

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

puts 'Creating Vets...'

file = URI.open('https://img.freepik.com/free-photo/young-man-doctor-wearing-white-coat-stethoscope-standing-with-skeptic-facial-expression-isolated-blue-background_141793-12721.jpg')
fernando_vet = Vet.new(fullname: 'Fernando da Silva', crmv: '39483743638', user_id: fernando.id, specialty: 'dermatology', clinic_id: andre_clinic.id)
fernando_vet.photo.attach(io: file, filename: "fernando_vet.png", content_type: "image/png")
fernando_vet.save!

file = URI.open('https://img.freepik.com/free-photo/young-woman-doctor-white-coat-with-phonendoscope-standing-with-big-smile-looking-camera-isolated-blue-background_141793-9841.jpg')
sirene_vet = Vet.new(fullname: 'Sirene Santos', crmv: '39483743584', user_id: sirene.id, specialty: 'oncology', clinic_id: andre_clinic.id)
sirene_vet.photo.attach(io: file, filename: "sirene_vet.png", content_type: "image/png")
sirene_vet.save!

file = URI.open('https://img.freepik.com/free-photo/young-woman-doctor-white-coat-with-phonendoscope-standing-with-big-smile-looking-camera-isolated-blue-background_141793-9841.jpg')
rogerio_vet = Vet.new(fullname: 'Rogério Silva', crmv: '39483745874', user_id: rogerio.id, specialty: 'oncology', clinic_id: rafael_clinic.id)
rogerio_vet.photo.attach(io: file, filename: "rogerio_vet.png", content_type: "image/png")
rogerio_vet.save!

puts 'Creating Appointments...'

appointment_1 = Appointment.new(vet_id: fernando_vet.id, pet_id: lupo.id, datetime: DateTime.now + 5)
appointment_1.save!

appointment_2 = Appointment.new(vet_id: fernando_vet.id, pet_id: lupo.id, datetime: DateTime.now - 10.2)
appointment_2.save!

appointment_3 = Appointment.new(vet_id: sirene_vet.id, pet_id: figaro.id, datetime: DateTime.now - 2.15)
appointment_3.save!

appointment_4 = Appointment.new(vet_id: fernando_vet.id, pet_id: lupo.id, datetime: DateTime.now - 5.5)
appointment_4.save!

appointment_5 = Appointment.new(vet_id: fernando_vet.id, pet_id: tobias.id, datetime: DateTime.now - 3.3)
appointment_5.save!

appointment_6 = Appointment.new(vet_id: rogerio_vet.id, pet_id: lupo.id, datetime: DateTime.now - 80.8)
appointment_6.save!

appointment_7 = Appointment.new(vet_id: rogerio_vet.id, pet_id: lupo.id, datetime: DateTime.now - 60.2)
appointment_7.save!

appointment_8 = Appointment.new(vet_id: rogerio_vet.id, pet_id: lupo.id, datetime: DateTime.now - 40.1)
appointment_8.save!

puts 'Creating Reviews...'

review_1 = Review.new(clinic_rating: 5, content: 'Very good appointment! Lupo was feeling much better!', appointment_id: appointment_2.id)
review_1.save!

review_2 = Review.new(clinic_rating: 2, content: 'The vet was a little rude and looked like she was in a hurry', appointment_id: appointment_3.id)
review_2.save!

puts 'Creating Records...'

record_1 = Record.new(content: 'Lupo occasionally limps after vigorous play or long walks. No history of trauma or accidents. Diagnosed with hip dysplasia at 2 years of age. Regular joint supplements (glucosamine and omega-3 fatty acids). Vaccinations up to date (DHPP, leptospirosis). Recheck in 20 days.', appointment_id: appointment_6.id)
record_1.save!

record_2 = Record.new(content: 'Lupo continues to experience mild right hind leg lameness after strenuous activity. No significant changes in behavior or appetite. Mild crepitus noted during hip joint palpation. Range of motion slightly improved. Recheck in 20 days. Continue joint supplements (glucosamine and omega-3 fatty acids). Increase exercise moderation to prevent exacerbation.', appointment_id: appointment_7.id)
record_2.save!

record_3 = Record.new(content: 'All symptoms are back. Maybe it was just a headache after all? I have no idea. Should have been an Engineer like my father wanted. Or joined Le Wagon, to be a great web dev.', appointment_id: appointment_8.id)
record_3.save!

puts 'Finished!'
