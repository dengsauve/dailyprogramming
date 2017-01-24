require 'win32/sound'
include Win32

def note (frequency, durations)
  durations.each do |d|
    Sound.beep(frequency, d)
  end
end

notations = File.readlines("./frequencies.txt")

notes = Hash.new(440)

notations.each do |i|
  set = i.split(" ")
  notes[set[0]] = set[1].to_i
end

# bpm = 150 so qn = 400 ms


note notes["As4"], [1066, 533, 266]
note notes["Gs4"], [133]
note notes["As4"], [666, 533, 266]
note notes["Gs4"], [133]
note notes["As4"], [666, 533, 200]
note notes["F4"], [900]
note notes["As4"], [200]
note notes["F4"], [350]
note notes["As4"], [225]
note notes["F5"], [600, 200]
note notes["As5"], [600, 200]