=begin
    Liste des incubateurs en France by http://www.mon-incubateur.com
=end

require 'open-uri'
require 'nokogiri'


# Liste les urls des incubateurs
def incubator_url_list(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Accede à l'url
    urls = []
    get_urls = doc.css("#incubators_list table span a") # Scrape les datas dans le span pour obtenir un tab de data

    # Parcour les les data
    get_urls.each do |x|
        urls.push("http://www.mon-incubateur.com" + x['href']) # Push les urls obtenu dans urls
    end
    urls
end

# Recupere les details concernant l'incubateur
def incubator_details(page_url)
    name = Nokogiri::HTML(open(page_url)).css(".promo-bar h2").text # Scrap le nom de l'incubateur
    postal_code = Nokogiri::HTML(open(page_url)).css(".promo-bar strong").text.split("\n").join(" ").split(" ")[0] # Scrap le code postal
    site_web = Nokogiri::HTML(open(page_url)).css(".content-area .info-block a")[26]['href'] # Scrap  le lien vers le site web
    {:name => name, :postal_code => postal_code, :site_web => site_web}
end


# Methode pour tester le code
def france_incubateurs
    list = incubator_url_list("http://www.mon-incubateur.com/site_incubateur/incubateurs")

    incubateur_fr = []
    list.each do |x|
        incubateur_fr.push(incubator_details(x))
    end

    incubateur_fr
end

puts france_incubateurs