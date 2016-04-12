# 取得したフィード(String)をフィードオブジェクトに変換する

require 'rss'
require_relative 'feed'

class FeedParser

  # フィード文字列をパースして、フィードオブジェクトを返す
  # @param [String] feed_string フィード文字列
  # @param [String] parser_type パーサの種類
  # @return [Feed] パース後のフィードオブジェクト
  # @note RSS以外のパーサーを使う必要がある場合はparser_typeで判定して、新しいパーサを追加する
  def self.parse(feed_string, parser_type="RSS")
    if parser_type == "RSS"
      rss_feed = RSS::Parser.parse(feed_string)
      Feed.new(rss_feed.channel.title, rss_feed.channel.description, rss_feed.channel.link, rss_feed.channel.items)
    end
  end
end
