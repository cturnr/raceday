class Racer < ActiveRecord::Base

@@db = nil
RACERS = 'racers'

def self.mongo_client
	@@db = Mongo::Client.new('mongodb://localhost:27017/test')
end

def self.collection
  collection=ENV['RACERS'] ||= RACERS
  return mongo_client[collection]
end

def self.all(prototype={}, sort={:number=>1}, skip=0, limit=nil)
  if !limit.nil?
    result = Racer.collection.find(prototype).sort(sort).skip(skip).limit(limit.to_i) 
  else
		result = Racer.collection.find(prototype).sort(sort).skip(skip)
	end
end


end