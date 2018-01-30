# controllers are maestros
# each method is a user story
# for each method it gets the info from user and/or repos
# uses views to interacte with the user
# create objects if needed and save them into the repos

require_relative "../views/patients_view"
require_relative "../models/patient"

class PatientsController
  # all controllers receive the respective repo as a parameter
  # PatientsController -> PatientRepository
  def initialize(repo)
    @repo = repo
    # all controllers create an instance of the respective view
    # PatientsController -> PatientsView
    @view = PatientsView.new
  end

  def list
    patients = @repo.all # get all the patients from the repo
    @view.display(patients) # print them using the view
  end

  def add
    # ask for name, cured and room
    # create the patient object
    # save it using repo!
  end
end
