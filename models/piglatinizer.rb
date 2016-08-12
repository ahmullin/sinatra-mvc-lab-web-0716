class PigLatinizer
  attr_accessor :text

def piglatinize(text)
  alpha1 = ('a'..'z').to_a
  alpha2 = ('A'..'Z').to_a
  alpha = alpha1 + alpha2
  vowels = ['a', 'A', 'e', 'E', 'i', 'I', 'o', 'O', 'u', 'U']
  consonants = alpha - vowels
  # binding.pry
  if vowels.include?(text[0])
    text + 'way'
  elsif consonants.include?(text[0]) &&
    consonants.include?(text[1]) && consonants.include?(text[2])
    text[3..-1] + text[0..2] + 'ay'
  elsif consonants.include?(text[0]) &&
    consonants.include?(text[1])
    text[2..-1] + text[0..1] + 'ay'
  elsif text[0..1] == "qu"
    text[2..-1]+"quay"
  elsif text[0..2] == "squ"
     text[3..-1]+"squay"
  else consonants.include?(text[0])
    text[1..-1] + text[0..0] + 'ay'
  end
end

  def to_pig_latin(sentence)
    sentence.split.collect do |word|
      piglatinize(word)
    end.join(" ")
  end
end
