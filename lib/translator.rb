require "yaml"
require "pry"

def load_library(file_name)
 new_file = YAML.load_file(file_name)
 hash = {"get_emoticon" => {}, "get_meaning" => {}}
 new_file.each do |mean, emo|
   hash["get_meaning"][emo[1]] = mean
   hash["get_emoticon"][emo[0]] = emo[1]
 end
 hash
end

def get_japanese_emoticon(file_name, emoticon)
  emo_hash = load_library(file_name)
    if emo_hash["get_emoticon"][emoticon]
      return emo_hash["get_emoticon"][emoticon]
    else
     return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, emoticon)
   emoticon_hash = load_library(file_name)
   #binding.pry
   if emoticon_hash["get_meaning"][emoticon]
     return emoticon_hash["get_meaning"][emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
end