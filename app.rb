
# create new repositories instances
require_relative "app/repositories/room_repository"
room_repo = RoomRepository.new('data/rooms.csv')

require_relative "app/repositories/patient_repository"
patient_repo = PatientRepository.new('data/patients.csv', room_repo)

# create new controllers intances
require_relative "app/controllers/patients_controller"
patients_controller = PatientsController.new(patient_repo)

# create router instance
require_relative "router"
router = Router.new(patients_controller)

# run app
router.run

