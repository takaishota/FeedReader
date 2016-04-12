# フィードを読み込むクラス

require_relative 'feed_parser'
require_relative 'feed_formatter'
require_relative 'http_client'

class FeedListLoader

  # インスタンスの作成
  # @return [FeedListLoader] FeedListLoaderクラスのインスタンス
  def initialize
    # フィード配信元リストの読み込み
    @sources = []
    begin
      File.foreach('source_list.txt') do |url|
        @sources << url.strip
      end
    rescue SystemCallError => e
      # エラーハンドリング
      puts %Q(class=[#{e.class}] message=[#{e.message}])
    end
  end

  # 各フィード配信元からRSSフィードを取得し、フィードオブジェクトの配列として返す
  # @return [Array] feed_list フィード一覧
  def load
    feed_list = []

    @sources.each do |rss_url|
      client = HTTPClient.new
      response = client.sendRequest(rss_url)

      feed = FeedParser.parse(response)
      feed_list << feed
    end

    return feed_list
  end

end
