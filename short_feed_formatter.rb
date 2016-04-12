# タイトル文字10文字、本文20文字の変換フォーマットを定義したクラス

require_relative 'console_output_format'
include ConsoleOutputFormat

class ShortFeedFormatter

  # @!attribute [w] title_count
  # @!attribute [w] description_count
  attr_writer :title_count, :description_count

  # インスタンスの作成
  # @return [ShortFeedFormatter] ShortFeedFormatterクラスのインスタンス
  def initialize
    @title_count = 10
    @description_count = 20
  end

end
