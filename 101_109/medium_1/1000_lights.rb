### PROBLEM ###
# You have a bank of switches before you, numbered from 1 to n. Each 
# switch is connected to exactly one light that is initially off. You 
# walk down the row of switches and toggle every one of them. You go 
# back to the beginning, and on this second pass, you toggle switches 
# 2, 4, 6, and so on. On the third pass, you go back again to the 
# beginning and toggle switches 3, 6, 9, and so on. You repeat this 
# process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, 
# and returns an Array that identifies which lights are on after n 
# repetitions.

# REQUIREMENTS:
# - there are n switches and we pass through them n times
# - all lights start off
# - each round we increase the number of lights we skip between flips by one
# - our first round we flip every light on
# - we should return an array indicating which lights are on

### EXAMPLES ###
# Example 1: 5 lights, return [1, 4]
# rd 1: 1 1 1 1 1 
# rd 2: 1 0 1 0 1
# rd 3: 1 0 0 0 1
# rd 4: 1 0 0 1 1
# rd 5: 1 0 0 1 0

# Example 2: 10 lights, return [1, 4, 9]

### DATA STRUCTURE ###
# input: integer representing both the number of lights and number of rounds
# intermediate: array of 0s and 1s representing 1, an on light, and 0, an off light
# output: the indices + 1 from our lights array where we have a 1, or a light on

### ALGORITHM ###

# - initialize an array, switches, containing n 1s
# - iterate through the switches array n times
#     - 'flipping' a switch means changing a 0 to 1 or a 1 to 0
#     - each round, we flip every (x)th switch, where x = the round number
#     - if we are on round 1, we flip every switch
#     - if we are on round 2, we flip every other switch
#     - if we are on round 3, we flip every 3rd switch
# - at the end we return an array with the idices of which switches are on


def flip_them_a_bunch(n)
  hallway = initialize_hallway(n)
  n.times do |round|
    hallway.each_with_index do |_, index|
      if (index + 1) % (round + 1) == 0
        flip_switch(hallway, index)
      end
    end
  end
  what_lights_are_on(hallway)
end

def flip_switch(arr, index)
  if arr[index] == 0
    arr[index] = 1
  else
    arr[index] = 0
  end
end

def initialize_hallway(n)
  hallway = []
  n.times { |i| hallway[i] = 0 }
  hallway
end

# takes a hallway array and returns an array of indices where the lights are on
def what_lights_are_on(arr)
  lights_on = []
  arr.each_with_index do |light, index|
    if light == 1
      lights_on << index + 1
    end
  end
  lights_on
end

p flip_them_a_bunch(5) == [1, 4]
p flip_them_a_bunch(10) == [1, 4, 9]
p flip_them_a_bunch(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
