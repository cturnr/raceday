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

end