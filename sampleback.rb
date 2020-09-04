require 'net/http'
require 'uri'
require 'json'

api_key= 'f7914518ec4fd7f05929098f73fa6e49'
#params = {latitude:34.6016491, longitude:133.7654716, range:1}

url='https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid='
url << api_key

  lati="34.6016491"
  long="133.7654716"
  range="2"
  hit="100"
  offset="2"
  url << "&latitude=" << lati #緯度で検索
  url << "&longitude=" << long #緯度で検索
  url << "&range=" << range #緯度で検索
  url << "&hit_per_page=" << hit #1ページあたりの表示数
  url << "&offset_page=" << offset

  url=URI.encode(url) #エスケープ
  uri = URI.parse(url)
  json = Net::HTTP.get(uri)
  result = JSON.parse(json)

  j = result["hit_per_page"]
  i = 0
  while i < j do
    @rests = [
            name = result['rest'][i]['name'],
            address = result['rest'][i]['address'],
            tel = result['rest'][i]['tel'],
            access = result['rest'][i]['access'],
            open = result['rest'][i]['opentime'],
            image = result['rest'][i]['image_url']
            ]

      puts @rests
      i += 1
  end
