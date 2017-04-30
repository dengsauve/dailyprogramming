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
sentences, sentence = [], ''
text.split('').each_with_index do |character, index|
  if (character == '.' and text.split('')[index-2] != '.' and text.split('')[index+2] != '.') or character == ('?' or  '!')
    sentences << sentence
    sentence = ''
  else
    sentence += character
  end
end

# score sentences initially at 0.0, and -1 point for every stop word.
# divide float score by sentence length
sentence_score = {}
sentences.each do |sentence|
  sentence_score[sentence] = 0.0
end

sentences.each do |sentence|
  score = 0
  stop_list.each do |stop|
    score += 1 if sentence.include?(stop)
  end
  sentence_score[sentence] = (sentence_score[sentence] - score)/sentence.length
end

# Take the two highest scoring sentences.
description = sentence_score.sort_by { |k, v| v}.reverse[0][0].strip + '.'
description += sentence_score.sort_by { |k, v| v}.reverse[1][0] + '.'

puts description
