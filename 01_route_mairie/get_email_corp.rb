=begin
   
    Script pour get email corp :P 

=end

require 'open-uri'
require 'nokogiri'

# Methode recuperer les emails
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Acceder à la page
    email = doc.css(".tr-last")[3].text.split(" ")[2] # Scraping des données
    email
end

#  Methode recuperer les emails
def get_all_the_urls_of_val_doise_townhalls(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Acceder à la page
    urls = []
    get_urls = doc.css("a[class=lientxt]") # Scrap des datas
    get_urls.each{|link| urls.push("http://annuaire-des-mairies.com"+link['href'][1..-1])} # On push les datas dans urls
    urls
end

# Methode pour tester le tout
def get_email()
    mairies = []
    tab_link = get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")# appel de la methode pour les urls
    tab_link.each do 
        |link|
        mairie = Nokogiri::HTML(open(link)).css('main h1')[0].text.split(" ")[0] # On scrap le nom
        # On push le tout dans mairies
        mairies.push({
            :name => mairie,
            :email => get_the_email_of_a_townhal_from_its_webpage(link)
        })
            puts mairies
    end
    puts "#################################################################################################"
    puts "                          RESULTAT"
    puts "#################################################################################################"
    mairies
end

#Appel de la methode de test
puts get_email