class Patient
  attr_reader :name, :cured
  attr_accessor :id, :room

  def initialize(attributes = {})
    # save the values that inside of the hash attributes
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @room = attributes[:room] # points to the room object where the patient is hospitalized
  end

  # cure the patient
  def cure!
    @cured = true
  end
end
