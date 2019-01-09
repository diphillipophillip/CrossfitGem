require 'pry'
class CrossfitGem::Entrant 

 

    attr_accessor :competitorName, :firstName, :lastName, :gender, :regionName, :affiliateName, :age, :height, :weight
    @@all = []

    def initialize(competitorName, firstName, lastName, gender, regionName, affiliateName, age, height, weight)
        @competitorName = competitorName 
        @firstName = firstName 
        @lastName = lastName 
        @gender = gender 
        @regionName = regionName 
        @affiliateName = affiliateName
        @age = age 
        @height = height 
        @weight = weight 
    end 

    def self.all 
        @@all 
    end 

    def save 
        @@all << self 
    end 

    def self.create(competitorName, firstName, lastName, gender, regionName, affiliateName, age, height, weight)
        new_entrant = CrossfitGem::Entrant.new(competitorName, firstName, lastName, gender, regionName, affiliateName, age, height, weight)
        new_entrant.save
        new_entrant
    end 

    def self.list_entrants
        var = CrossfitGem::Api.data 
        var["leaderboardRows"].each do |i| 
         entrant = i["entrant"]
          competitorName = entrant["competitorName"]
          firstName = entrant["firstName"]
          lastName = entrant["lastName"]
          gender = entrant["gender"]
          regionName = entrant["regionName"]
          if !CrossfitGem::Affiliate.all.map {|i| i.name}.include?(entrant["affiliateName"]) 
           affiliateName = CrossfitGem::Affiliate.new(entrant["affiliateName"]) 
          end 
          age = entrant["age"]
          height = entrant["height"]
          weight = entrant["weight"]
          new_entrant = CrossfitGem::Entrant.create(competitorName, firstName, lastName, gender, regionName, affiliateName, age, height, weight)
          affiliateName.add_entrant(new_entrant) unless affiliateName == nil
        end   
    end 

    def self.find_by_name(name)
        self.all.find do |i| 
            if i.competitorName.upcase == name 
             puts "--------------------------------------------"
             puts i.competitorName 
             puts i.firstName 
             puts i.lastName
             puts i.gender 
             puts i.regionName
             puts i.affiliateName.name
             puts i.age
             puts i.height
             puts i.weight 
            end 
        end 
    end 


            




end 



