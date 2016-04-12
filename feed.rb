# Feed
# RSSフィード

class Feed
  # @!attribute [rw] title
  # @!attribute [rw] description
  # @!attribute [rw] link
  # @!attribute [rw] entries
  attr_accessor :title, :description, :link, :entries

  # インスタンスの作成
  # @param [String] title
  # @param [String] description
  # @param [String] link
  # @param [String] entries
  # @return [Feed] Feedクラスのインスタンス
  def initialize(title, description, link, entries)
    @title = title
    @description = description
    @link = link
    @entries = entries
  end

end
