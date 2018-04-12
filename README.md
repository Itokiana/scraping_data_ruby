# scraping_data_ruby
# Itokiana - Madagascar
# Slack: itokiana73

## a. Route de la mairie 
- Tout d'abord, écris une méthode get_the_email_of_a_townhal_from_its_webpage qui, comme son nom l'indique, récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal => Done 
- Ensuite, écris une méthode get_all_the_urls_of_val_doise_townhalls qui, comme son nom l'indique, récupère toutes les url de villes du Val d'Oise. C'est recommandé de le faire de cette page web => Done
- BONUS : c'est quand même recommandé d'enregistrer les urls dans un hash propre du genre { :name => "nomDeLaVille", :email=> "ville@machin.chose" } pour que le CEO de get-email-corp ne soit pas trop perdu => Done

## b. Trader de l'obscur 
- Va sur CoinMarketCap et fait un programme qui va récupérer le cours de toutes les cryptomonnaies, et les enregistrer bien proprement dans une array de hashs. => Done 
- BONUS : fais en sorte que ton programme tourne en boucle, et prenne lex taux toutes les heures => Done

## c. Route des incubateurs 
- Ta mission va légèrement changer, puisque tu vas devoir trouver toi-même un site qui recense une grande liste d'incubateurs en France, puis tu vas devoir utiliser Nokogiri pour récupérer :

    le nom de l'incubateur
    le code postal
    un petit site internet

Cet exercice te demandera d'aller voir quelques annuaires, et de travailler sur celui qui te semble le mieux.. => Done 