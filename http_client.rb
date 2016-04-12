# HTTP通信を管理するクラス

require 'net/http'
require 'uri'

class HTTPClient

  # リクエストを生成し、URLに送信する
  # @param [String] request_url フィード取得元URL
  # @return [String] 取得したレスポンスのボディ
  def sendRequest(request_url)
    url = URI.parse(request_url)
    req = Net::HTTP::Get.new(url.path)

    begin
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.open_timeout = 5
        http.read_timeout = 10
        http.request(req)
      end

      case res
      when Net::HTTPSuccess
        return res.body
      else
        # エラーハンドリング
        puts [url.to_s, e.class, e].join(" : ")
      end
    rescue => e
      # エラーハンドリング
      puts [url.to_s, e.class, e].join(" : ")
    end
  end
end
