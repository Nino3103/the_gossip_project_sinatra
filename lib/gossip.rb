require 'csv'
require 'pry'
require 'bundler'
Bundler.require

class Gossip

attr_accessor :author
attr_accessor :gossip


  def initialize(author, gossip)
    @author = author
    @gossip = gossip
  end


  def save
  CSV.open("./db/gossip.csv", "ab") do |csv|
    csv << [@author, @gossip]
   end
  end


  def self.all
  all_gossips = []
  csv_doc = CSV.read("./db/gossip.csv")
  csv_doc.each do |csv_line|
    all_gossips << Gossip.new(csv_line[0], csv_line[1])
  end
  return all_gossips
  end

  def self.find(id)
    return self.all[id]
  end




end
