=begin
PEDAC
P
Input: An integer that is the total number of switches
Output: An array of integers which are the lights that remain on after input
        integer repetitions of switching

E
toggling(5) == [1, 4]
toggling(10) == [1, 4, 9]

D
Input: An integer
Output: An array of integers

A
Example: n = 5
0: -, -, -, -, -
1: 1, 2, 3, 4, 5
2: 1, -, 3, -, 5
3: 1, -, -, -, 5
4: 1, -, -, 4, 5
5: 1, -, -, 4, -
=> [1, 4]

- Initialize an arr with input int number of 0 (0 is off; 1 is on)
- Repeat below for input int times (from 1)
  - Iterate over arr with index
    - Toggle element if (index + 1) % iteartion num == 0 and vice versa
- Select the indices of 1s out of arr and return
=end

=begin
def toggle(switch)
  switch == 0 ? 1 : 0
end

def toggling(num_lights)
  switches = []
  num_lights.times { switches << 0 }

  (1..num_lights).each do |n|
    switches.each_index do |i|
      switches[i] = toggle(switches[i]) if (i + 1) % n == 0
      end
  end

  switches.each_index.with_object([]) do |i, result|
    result << i + 1 if switches[i] == 1
  end
end
=end

=begin
FURTHER EXPLORATION

Q1: Do you notice the pattern in our answer? Every light that is on is a
    perfect square. Why is that?

A: Only lights that are perfect squares get toggled odd-number of times. For
   instance, the 36th light gets toggled at the 1st, 2nd, 3rd, 4th, 6th, 9th,
   12th, 18th, and 36th iteration. It's thus been toggled 9 times, so it's left
   on in the end as it began as off.
=end

=begin
Q2: What are some alternatives for solving this exercise? What if we used an
    Array to represent our 1000 lights instead of a Hash, how would that change
    our code?

A: In my solution (new) above, I used an array to represent the lights. If I
   were to also use an array for the lights in the Official Solution, I'd
   implement it as below.
=end

=begin
# initialize the lights array
def initialize_lights(number_of_lights)
  Array.new(number_of_lights, "off")
end

# return list of light numbers that are on
def on_lights(lights)
  lights.each_with_index.with_object([]) do |(light, i), result|
    result << (i + 1) if light == "on"
  end
end

# toggle every nth light in lights array
def toggle_every_nth_light!(lights, nth)
  lights.each_index do |idx|
    if (idx + 1) % nth == 0
      lights[idx] = (lights[idx] == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  on_lights(lights)
end
=end

=begin
Q3: We could have a method that replicates the output from the description of
    this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.") How
    would we go about writing that code?
=end

# A
# initialize the lights array
def initialize_lights(number_of_lights)
  Array.new(number_of_lights, "off")
end

# return list of light numbers that are on
def on_lights(lights)
  lights.each_with_index.with_object([]) do |(light, i), result|
    result << (i + 1) if light == "on"
  end
end

def off_lights(lights)
  lights.each_with_index.with_object([]) do |(light, i), result|
    result << (i + 1) if light == "off"
  end
end

# toggle every nth light in lights array
def toggle_every_nth_light!(lights, nth)
  lights.each_index do |idx|
    if (idx + 1) % nth == 0
      lights[idx] = (lights[idx] == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights_on_and_off(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light!(lights, iteration_number)
  end

  [on_lights(lights), off_lights(lights)]
end

# Formulate multiple lights but not the last one
def formulate_multiple_lights(lights)
  result = ''
  lights[0...-1].each do |position|
    result += "#{position}, "
  end

  result
end

# Formulate the final string
def formulate_description(number_of_lights)
  lights_on_and_off = toggle_lights_on_and_off(number_of_lights)
  lights_on = lights_on_and_off.first
  lights_off = lights_on_and_off.last

  description_off =
    (if lights_off.empty?
       "No light is off; "
    elsif lights_off.size == 1
       "Light #{lights_off.first} is now off."
    else
       'Lights ' + formulate_multiple_lights(lights_off) + 'and ' + "#{lights_off.last}" + ' are now off; '
    end)

  description_on =
    (if lights_on.size == 1
       "light #{lights_on.first} is on."
    else
       formulate_multiple_lights(lights_on) + 'and ' + "#{lights_on.last}" + ' are on.'
    end)

  "#{description_off}#{description_on}"
end

p formulate_description(1)
p formulate_description(2)
p formulate_description(3)
p formulate_description(4)
p formulate_description(5)
p formulate_description(10)
