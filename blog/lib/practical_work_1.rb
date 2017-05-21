require 'faraday'
require 'pry'
# get image from the URL and save to local file using backend HTTP client
class Image
  def self.download(url)
    response = Faraday.get url
    # binding.pry
    if response.status > 399
      raise ArgumentError, 'Response status code is not correct'
    elsif response.headers['content-type'] =~ /image/
      File.open(url.split('/').last, 'wb') { |fp| fp.write(response.body) }
    else
      raise TypeError, 'File is not an image'
    end
  end
end
