require 'sinatra'
require 'sinatra/reloader'
require_relative 'weather'

# まだ何もわたされていない場合
get '/' do
  erb :index
end

# 情報がPOSTされてきた場合
post '/' do
  # 天気クラスのインスタンス化
  weather_reporter = Weather.new
  # 天気情報の取得
  result = weather_reporter.weatherReport(params[:area])

  @title = result['title'] # 場所
  @publicTime = result['publicTime'] # 発表日時
  @description = result['description']['text'] # 概要
  @forecasts = result['forecasts'] # 天気情報

  erb :index
end