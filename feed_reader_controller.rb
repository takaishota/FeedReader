# アプリケーションのエントリポイント

require_relative 'feed_list_view_controller'

class FeedReaderController

  # インスタンスの作成
  # @return [FeedReaderController] FeedReaderControllerクラスのインスタンス
  def initialize
    FeedListViewController.new
  end

  self.new
end
