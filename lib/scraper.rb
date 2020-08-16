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
          hash[:twitter] = element.attr('href')
        elsif element.attr('href').include?("linkedin")
          hash[:linkedin] = element.attr('href')
        elsif element.attr('href').include?("github")
          hash[:github] = element.attr('href')
        elsif element.attr('href').end_with?("com/")
          hash[:blog] = element.attr('href')
        end
      end
      hash[:profile_quote] = doc.css(".vitals-container.vitals-text-container .profile-quote").text
      hash[:bio] = doc.css(".bio-block.details-block .bio-content.content-holder .description-holder p").text

     hash
  end
    


end

