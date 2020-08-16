require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    student_cards = doc.css(".student-card a")
    student_cards.collect do |object|
      {:name => object.css(".student-name").text, 
      :location => object.css(".student-location").text,
      :profile_url => object.attr('href')}
=======
    student_cards = doc.css(".student_card a")
    student_cards.collect do |element|
      {:name => element.css(".student-name").text, 
      :location => element.css(".student-location").text,
      :profile_url => element.attr('href')}
>>>>>>> 18576dc4c3634bb122e203c5e7dfab2bfb7c75c3
    
    end
  end
  

  def self.scrape_profile_page(profile_url)
  
    
    
  end

end

