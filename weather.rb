require 'net/http'
require 'uri'
require 'json'

# 天気クラス
class Weather

  # 引数 -> 場所
  def weatherReport(area)
    uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=' + area.to_s)
    json = Net::HTTP.get(uri)
    result = JSON.parse(json)
    return result
  end

end