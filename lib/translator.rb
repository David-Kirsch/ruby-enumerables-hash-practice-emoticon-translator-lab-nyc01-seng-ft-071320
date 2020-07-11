require 'pry'
require "yaml"

def load_library (path)
    emoticons = YAML.load_file('lib/emoticons.yml')
      library = {}
    emoticons.each do |emotion, expression|
      library[emotion] = {}
      library[emotion][:english] = expression[0]
      library[emotion][:japanese] = expression[1]
    end
    library
  end
  
  def get_english_meaning(file, emoticon)
    emoticons = load_library(file)
    
    emoticons.each do |name, symbols|
      if(symbols[:japanese] == emoticon)
        return name
      end
    end
    "Sorry, that emoticon was not found"
  end
  
  def get_japanese_emoticon(file, emoticon)
    emoticons = load_library(file)
    
    emoticons.each do |name, emoji|
      if(emoji[:english] == emoticon)
        return emoji[:japanese]
      end
    end
    "Sorry, that emoticon was not found"
  end
  
  
  
  
  
  
  
    