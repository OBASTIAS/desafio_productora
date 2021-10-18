class Group < ApplicationRecord
    enum gender: [ :males, :females, :both]
    
    has_many :concerts, dependent: :delete_all

    def total_concerts
        self.concerts.count
    end

    def debut
        concerts = self.concerts
        if concerts.present?
            concerts.order(concert_date: :desc).first.concert_date
        else
            return "sin debut"
        end
    end

    def audience
        concerts = self.concerts
        concerts.sum{|x| x.audience}
    end

end
