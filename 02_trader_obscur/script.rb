require 'open-uri'
require 'nokogiri'

def cours_cryptomonnnaies(page_url)
    doc = Nokogiri::HTML(open(page_url)) # Acces à la page
    cours = []
    el_tab = doc.css("#currencies-all tbody tr") # Scrap de data
    for i in 0...el_tab.length do # On parcours
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ") # on scrap pour avoir les datas du tableau des cours
        # On push les datas obtenues dans cours
        cours.push({
            :name => x[2],
            :symbol => x[1],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
        puts cours
        puts "\n######################################### CHARGEMENT #####################################\n"
    end
    puts "############################################################################################################"
    puts "                                      RESULTAT"
    puts "############################################################################################################"
    cours
end


# Boucle infinie qui prend un temps de pause toutes les 1h 
while 0 < 1 do
    puts cours_cryptomonnnaies("https://coinmarketcap.com/all/views/all/")
    puts "############################################################################################################"
    puts "                                      PAUSE"
    puts "############################################################################################################"
    sleep 3600
end