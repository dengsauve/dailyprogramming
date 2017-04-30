# den510
# DailyProgrammer
# Challenge: Write an implementation of a text summarizer that can take a block of text (e.g. a paragraph),
# and emit a one or two sentence summarization of it.


# Read in Stop list
stop_file, stop_list = File.open('stop.txt','r+'), []
stops = stop_file.readlines
stops.each do |line|
  if line.split(' ')[0] != nil and line.split(' ')[0] != '|'
    stop_list << line.split(' ')[0].gsub('|', '')
  end
end
stop_file.close

# Read in paragraph.txt
text_file = File.open('paragraph.txt', 'r+')
text = text_file.readline.gsub("\n", '')
text_file.close

# divide whole text into sentences (logic to avoid acronyms)



# score sentences initially at 0.0, and -1 point for every stop word.

# divide float score by sentence length

# Take the two highest scoring sentences.




















#end
