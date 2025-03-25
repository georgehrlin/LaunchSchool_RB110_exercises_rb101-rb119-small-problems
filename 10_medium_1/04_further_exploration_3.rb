=begin
We could have a method that replicates the output from the description of this
problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How would we
go about writing that code?
=end

=begin
PEDAC
P
Input:
- An int that indicates the number of total lights
- An arr of ints that indicate which lights are on
Output:
- An output of a str that displays which lights are on and which are off

E
display_light_status(10)
# Output: Lights 2, 3, and 5 are off. Lights 1, 4, and 9 are on."

D
Input: An arr of ints
Output: An output of a str

A
- Generate an arr of lights that are on by calling toggle_lights
- Initialize an arr of ints from 11 to input int
- Generate an arr of lights that are off using the two arrs
- Output a str with two the two arrs appropriately formated and interpolated
=end

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off"}
  lights
end

def on_lights(lights)
  lights.select { |_position, state| state == 'on' }.keys
end

def toggle_every_nth_light!(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == 'off') ? 'on' : 'off'
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  on_lights(lights)
end

def str_list_formatter(arr)
  if arr.size == 1
    arr[0].to_s
  elsif arr.size == 2
    arr.join(' and ')
  else
    arr[0..-2].join(', ') + ' and ' + arr[-1].to_s
  end
end

def display_light_status(number_of_lights)
  lights_all = (1..number_of_lights).to_a
  lights_on = toggle_lights(number_of_lights)
  lights_off = lights_all - lights_on

  is_or_are_on = lights_on.size == 1 ? 'is' : 'are'
  is_or_are_off = lights_off.size == 1 ? 'is' : 'are'

  puts "Lights #{str_list_formatter(lights_off)} #{is_or_are_off} off. " + 
       "Lights #{str_list_formatter(lights_on)} #{is_or_are_on} on."
end

display_light_status(2)
display_light_status(10)
