require 'open-uri'
require 'pry'
require 'nokogiri'


def name_deputate

  doc = Nokogiri::HTML(open ("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

@name =doc.xpath('//*[@id="deputes-list"]/div/ul/li/a').map{ |item| item.text}

puts @name

end

name_deputate
