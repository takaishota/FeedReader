# タイトル文字10文字、本文30文字の変換フォーマットを定義したクラス

require_relative 'console_output_format'
include ConsoleOutputFormat

class DefaultFeedFormatter
  # @!attribute [w] title_count
  # @!attribute [w] description_count
  attr_writer :title_count, :description_count

  # インスタンスの作成
  # @return [DefaultFeedFormatter] DefaultFeedFormatterクラスのインスタンス
  def initialize
    @title_count = 10
    @description_count = 30
  end

end
