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
