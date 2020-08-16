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
    
    end
  end
  

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    hash = {} 
      social = doc.css(".vitals-container.social-icon-container a")
      social.each do |element|
        if element.attr('href').include?("twitter")
          return_hash[:twitter] = element.attr('href')
        elsif element.attr('href').include?("linkedin")
          return_hash[:linkedin] = element.attr('href')
        elsif element.attr('href').include?("github")
          return_hash[:github] = element.attr('href')
        elsif element.attr('href').end_with?("com/")
          return_hash[:blog] = element.attr('href')
        end
      end
    
    
  end

end

