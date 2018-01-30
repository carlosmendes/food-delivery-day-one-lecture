class Room
  attr_accessor :id
  def initialize(attributes = {})
    # save the values that inside of the hash attributes
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || [] # list of patients objects that are hospitalized in this room
  end

  # check if the room is full
  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    patient.room = self # the room in which this method add_patient was called
    @patients << patient
  end
end
