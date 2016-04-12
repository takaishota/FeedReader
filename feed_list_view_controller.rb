# フィード一覧を表示するViewと必要なリソースの管理を行う

require_relative "feed_list_loader"
require_relative "console_view"

class FeedListViewController

  # インスタンスの作成
  # @return [FeedListViewController] FeedListViewControllerクラスのインスタンス
  def initialize
    # viewに設定するフィード一覧を取得
    feed_list = self.get_feed_list

    # 標準出力用のViewクラスを生成
    console = ConsoleView.new

    self.generate_view(feed_list, console)
  end

  # フィード一覧を取得
  # @return [Array] フィード一覧
  def get_feed_list
    loader = FeedListLoader.new
    loader.load
  end

  # viewを生成する
  # @param [Array] list 取得したフィード一覧
  # @param [Object] view フィード一覧を表示するビュー
  # @note viewの仕様を変更したい場合は新たにクラスを追加し、generate()を実装する
  def generate_view(list, view)
    formatter = FeedFormatter.new
    formatted_list = []

    list.each do |feed|
      formatted_list << formatter.format(feed)
    end

    view.generate(formatted_list)
  end

end
