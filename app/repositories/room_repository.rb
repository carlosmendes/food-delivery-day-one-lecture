require_relative "../models/room"
require "csv"

class RoomRepository
  def initialize(csv_file)
    @csv_file = csv_file # path to the csv_file rooms.csv
    @rooms = [] # list of room objects
    @next_id = 1 # if of the next object to be created
    load_csv # load the csv files
  end

  # find room
  def get_room(id)
    # compare the id parameter with the one that is inside of object room
    @rooms.find {|room| room.id == id.to_i}
  end

  private

  def load_csv
    # headers: :first_row -> skips first row of csv
    # header_converters: :symbol -> each row is a hash
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # initially the row variable has: {id: "1", capacity: "5"}
      row[:id]       = row[:id].to_i       # Convert column to Integer
      row[:capacity] = row[:capacity].to_i # Convert column to Integer
      # after the last two lines the row is: {id: 1, capacity: 5}
      @rooms << Room.new(row) # add the Room object with the csv row info with the @rooms array
    end
    # specify the id of the next object to be saved in the @rooms array
    @next_id = @rooms.last.id + 1 unless @rooms.empty?
  end
end
