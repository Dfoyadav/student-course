class Course < ApplicationRecord
  has_many :students
  validates :name,:duration, presence: true
require 'csv'

  def self.to_csv
    attributes = %w{id name duration}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |course|
        csv << attributes.map{ |attr| course.send(attr) }
      end
    end
  end


 after_create :send_message

 def send_message
   course = Twilio::REST::Client.new
   course.messages.self({messaging_service_sid: 'MG1130bb962ec8ab447d9754e832569db6',


                            from: ENV['TWILIO_PHONE_NUMBER'],
                            to: '+919838403180',
                            body: 'Hello there! This is a test'
                          })
 end  

end
