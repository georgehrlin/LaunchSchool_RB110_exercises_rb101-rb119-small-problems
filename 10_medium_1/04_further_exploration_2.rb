=begin
What are some alternatives for solving this exercise? What if we used an Array
to represent our 1000 lights instead of a Hash, how would that change our code?
=end

=begin
My original answer to the question (the old one) used an array to represent the
lights, so I will modify the Official Solution here to use an array instead.
=end

def initialize_lights(number_of_lights)
  lights = Array.new
  1.upto(number_of_lights) { lights << "off" }
  lights
end

def on_lights(lights)
  result = []
  lights.each_with_index { |light, idx| result << (idx + 1) if light == 'on'}
  result
end

def toggle_every_nth_light!(lights, nth)
  lights.each_index do |idx|
    if (idx + 1) % nth == 0
      lights[idx] = (lights[idx] == 'off') ? 'on' : 'off'
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
    p lights
  end

  on_lights(lights)
end

p toggle_lights(1000) # == [1, 4, 9]
