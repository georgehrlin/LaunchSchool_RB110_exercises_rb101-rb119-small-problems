=begin
1000 Lights

You have a bank of switches before you, numbered from 1 to n. Each switch is
connected to exactly one light that is initially off. You walk down the row of
switches and toggle every one of them. You go back to the beginning, and on
this second pass, you toggle switches 2, 4, 6, and so on. On the third pass,
you go back again to the beginning and toggle switches 3, 6, 9, and so on. You
repeat this process and keep going until you have been through n repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.
=end

=begin
PEDAC
P
Input:
- An int that represents the number of lights
Output:
- An arr of ints that represent which lights are on

E
switching_lights(5) # == [1, 4]
switching_lights(10) # == [1, 4, 9]

D
Input: An int
Intermediate: An arr of ints
Output: An arr of ints

A
- Helper: flip
  - IF 0 then 1
  - ELSE then 0

- 0 indicates off; 1 indicates on
- Initialize an arr of (input int) number of 0s
- Loop 1: flip vals at indices that are (multiples of 1 - 0)
- Loop 2: flip vals at indices that are (multipels of 2 - 1)
- Loop 3: flip vals at indices that are (multiples of 3 - 1)
- Loop 4: flip vals at indices that are (multiples of 4 - 1)
- (Input int number of loops)
- Finally, return arr of ints that are indices at which the vals are 1
=end

=begin
def flip_switch(val)
  val == 0 ? 1 : 0
end

def lights_on_positions(lights)
  result = []
  lights.each_with_index do |light, idx|
    result << idx + 1 if light == 1
  end

  result
end

def switching_lights(num_of_lights)
  lights = Array.new(num_of_lights, 0)

  num_of_lights.times do |n|
    lights.each_index do |idx|
      if (idx + 1) % (n + 1) == 0
        lights[idx] = flip_switch(lights[idx])
      end
    end
  end

  lights_on_positions(lights)
end
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

p toggle_lights(10) # == [1, 4, 9]
