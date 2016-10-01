require 'net/http'
require 'uri'
require 'json'

# 天気クラス
class Weather

  # 引数 -> 場所
  def weatherReport(area)
    begin
      uri = URI.parse('http://weather.livedoor.com/forecast/webservice/json/v1?city=' + area.to_s)
      json = Net::HTTP.get(uri)
      result = JSON.parse(json)
    rescue => ex
      p ex
      result = "通信障害が発生しました"
    ensure
      return result
    end
  end

end