require 'open-uri'
require 'pry'
require 'nokogiri'


def get_the_price_of_a_crypto

  doc = Nokogiri::HTML(open ("https://coinmarketcap.com/all/views/all/"))

@price =doc.xpath('//*[contains(@class,"no-wrap text-right")]').map{ |item| item["data-sort"]}.map{ |item| item="$#{item}"}



end
get_the_price_of_a_crypto


def get_the_name_of_a_crypto

  doc = Nokogiri::HTML(open ("https://coinmarketcap.com/all/views/all/"))

@name =doc.xpath('//*[contains(@class,"currency-name-container link-secondary")]').map{ |item| item.text}


end
get_the_name_of_a_crypto

def perform

puts  @name.zip(@price)

end
perform

#<a class="currency-name-container link-secondary" href="/currencies/bitcoin/">Bitcoin</a>
#/*[contains(@class,"no-wrap text-right")]

=begin
#
def get_all_the_urls_of_val_doise_townhalls

  doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  #//p/ permet de récupérer tous les liens des paragraphes
  #1er .map crée un tableau avec tous les liens
  #2ème .map permet je récupérer tous les liens
  	url_array=doc.xpath('//p/a').map { |link| link["href"]}.map { |link| "http://annuaire-des-mairies.com#{link [1..-1]}"}
  	  puts 	url_array

end
get_all_the_urls_of_val_doise_townhalls

//*[@id="id-bitcoin"]/td[5]

//*[@id="id-ethereum"]

//*[@id="id-ethereum"]/td[5]
=end
