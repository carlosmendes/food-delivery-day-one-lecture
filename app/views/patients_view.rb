class PatientsView
  # for each patient print the info
  def display(patients)
    patients.each do |patient|
      puts "#{patient.name} is at room #{patient.room.id}"
    end
  end
end
