# CHECK THE ROOM repo for more detailed comments

require_relative "../models/patient"
require "csv"

class PatientRepository
  def initialize(csv_file, room_repo)
    @csv_file = csv_file
    @patients = [] # all the objects that are saved on the csv file!
    @room_repo = room_repo
    @next_id = 1
    load_csv
  end

  def get_patient(id) # find patient
    @patients.find {|patient| patient.id == id.to_i}
  end

  # add a new patient to repo and csv file
  def add(patient)
    patient.id = @next_id # define the patient id
    @next_id += 1 # increment the next id
    @patients << patient # save the patient into the array
    save_csv # save all patients into the csv
  end

  # returns all patients
  def all
    @patients
  end

  private

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << ["id","name","cured","room_id"] # first row of csv
      # convert objects @patients array to csv_row
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured, patient.room.id]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean
      row[:room]  = @room_repo.get_room(row[:room_id])
      @patients << Patient.new(row)
    end
    @next_id = @patients.last.id + 1 unless @patients.empty?
  end
end
