# routes the user to be able to choose actions
class Router
  def initialize(patients_controller)
    # receives all controllers as instance variables
    @patients_controller = patients_controller
  end

  def run
    loop do
      # print menu
      print_menu
      # ask for action
      action = ask_for_action
      # route user
      route_user(action)
    end
  end

  private

  # prints all the options
  def print_menu
    puts "1. List patients"
    # ....
  end

  def ask_for_action
    puts "What do you want to do next?"
    print "> "
    gets.chomp.to_i
  end

  # calls the respective controller and method
  def route_user(action)
    case action
    when 1 then @patients_controller.list
    end
  end
end

