# USE THIS file the test INDIVIDUALLY your classes

require_relative "app/models/patient"
require_relative "app/models/room"
require_relative "app/repositories/patient_repository"
require_relative "app/repositories/room_repository"

#
room_repo = RoomRepository.new('data/rooms.csv')
# p room_repo
# p room_repo.get_room(2)

patient_repo = PatientRepository.new('data/patients.csv', room_repo)

olya = Patient.new(name: "Olya", room: room_repo.get_room(2))
patient_repo.add(olya)
p patient_repo

# p patient_repo
# p carlos
# telma = Patient.new(name: "Telma", cured: true)

# room = Room.new(capacity: 5)

# room.add_patient(carlos)
# p room

# carlos.room
