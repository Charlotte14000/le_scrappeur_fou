require 'open-uri'
require 'pry'
require 'nokogiri'



def get_the_email_of_a_townhal_from_its_webpage(url_townhal)


  doc = Nokogiri::HTML(open(url_townhal))

  doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|

  	  return node.text
  	end
end

get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

#value =  page.xpath('//*[contains(@class,"no-wrap text-right")]').map{ |item| item["data-sort"]}.map{ |item| item="$#{item}"}

def get_all_the_urls_of_val_doise_townhalls

  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  #//p/ permet de récupérer tous les liens des paragraphes
  #1er .map crée un tableau avec tous les liens
  #2ème .map permet je récupérer tous les liens
  	url_array=doc.xpath('//p/a').map { |link| link["href"]}.map { |link| "http://annuaire-des-mairies.com#{link [1..-1]}"}

      name_mairie= doc.xpath('//p/a').map { |link| link.text}

      n=0
url_array2=Array.new
#boucle while tant que n est inférieur au nombre d'url la boucle continu de mettre les emails dans
#pour tous les url de mairies dans url_array on applique la méthode get_the_email_of_a_townhal_from_its_webpage.
#puis on stock dans url_array2.
#n=n+1 permet de passer à l'url suivant
      while n<url_array.length

        url_array2<<get_the_email_of_a_townhal_from_its_webpage(url_array[n])

        n=n+1
      end
puts name_mairie.zip(url_array2)



end
get_all_the_urls_of_val_doise_townhalls
