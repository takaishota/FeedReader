# フィードを表示用に加工するクラス

require_relative 'entry'
require_relative 'default_feed_formatter'
require_relative 'short_feed_formatter'


class FeedFormatter

  # パース後のフィードを整形して、フィード一覧配列に追加する
  # @param [Feed] feed フィード
  # @return [String]  フォーマット化されたフィード
  def format(feed)
    default_formatter = DefaultFeedFormatter.new
    default_formatter.format(feed)
  end
end
