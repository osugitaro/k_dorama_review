require 'mechanize'

class Scraping
  def self.dorama_urls
    agent = Mechanize.new
    links = []

    current_page = agent.get("https://www.konest.com/contents/drama_list.html?drama_syear=0&cp=2&genre=revenge")
    elements = current_page.search('td span a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    links.each do |link|
      get_dorama("https://www.konest.com" + link)
    end
  end

  def self.get_dorama(link)
    uri_str = link
    uri = URI.parse(uri_str)
    query = Rack::Utils.parse_nested_query(uri.query)
    id = query["id"]
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.tit_title h1').inner_text if page.at('.tit_title h1')
    cast = page.at('.indent').inner_text if page.at('.indent')
    genre_img = page.search(".tit_title img") if page.search(".tit_title img")
    genre = "復讐"
    genre_img.each do |g|
      genre << g.get_attribute('alt') + ","
    end
    introduction = page.at('/html/body/div[2]/div/div/div[1]/table[2]/tr[2]/td/span').inner_text if page.at('/html/body/div[2]/div/div/div[1]/table[2]/tr[2]/td/span')
    image = page.at("/html/body/div[2]/div/div/div[1]/table[3]/tr/td/table/tr/td/img")[:src] if page.at("/html/body/div[2]/div/div/div[1]/table[3]/tr/td/table/tr/td/img")[:src]
    page.image_with(:src => image).fetch.save("app/assets/images/k_dorama/revenge/#{id}.jpg")

    unless KDorama.where(title: title)
      k_dorama = KDorama.new
      k_dorama.title = title
      k_dorama.cast = cast
      k_dorama.genre = genre
      k_dorama.introduction = introduction
      k_dorama.image.attach(io: File.open(Rails.root.join("app/assets/images/k_dorama/revenge/#{id}.jpg")), filename: "#{id}.jpg", content_type: 'image/jpg')
      k_dorama.save
    end
  end
end
