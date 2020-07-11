require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = Hash.new

  
  emoticons.each do |english_word, emoticon_set|
    emoticon_hash[english_word] = Hash.new
    emoticon_hash[english_word][:english] = emoticon_set[0]
    emoticon_hash[english_word][:japanese] = emoticon_set[1]
  end
  emoticon_hash
end


def get_japanese_emoticon(path, emoticon)
  # code goes here
  converted_file = load_library(path)
  converted_file.each do |key, translated_version|
    if(translated_version[:english] == emoticon)
      return translated_version[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  # code goes here
   converted_file = load_library(path)
  
  converted_file.each do |key, translated_version|
    if(translated_version[:japanese] == emoticon)
      return key
    end
  end
    return "Sorry, that emoticon was not found"
end