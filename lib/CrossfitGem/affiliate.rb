require 'pry'
class CrossfitGem::Affiliate 

    

    attr_accessor :name, :entrant
    @@all = []
    

    def initialize(name) 
        @name = name
        @entrants = []
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

    def save 
        @@all << self 
    end 

    def self.create(name)
        new_affiliate = CrossfitGem::Affiliate.new(name)
        new_affiliate.save
        new_affiliate
    end 
 
    def add_entrant(entrant)
        # entrant.affiliateName = self unless entrant.affiliateName 
        @entrants << entrant unless @entrants.include?(entrant)
        
    end 

    def entrants 
        @entrants 
    end 

    # def self.list_affiliates 
    #     array = []
    #     var = CrossfitGem::Api.data 
    #     var["leaderboardRows"].each do |i| 
    #      entrant = i["entrant"]
    #       affiliate_name = entrant["affiliateName"]
    #         CrossfitGem::Affiliate.create(affiliate_name) unless entrant["affiliateName"].empty? 
                     
    #     end 
    # end 

    def self.find_by_name(name)
        self.all.find {|i| 
         if i.name.upcase == name
         puts i.name 
        
        end 
        } 
    end 



end 





    
