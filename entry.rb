# Entity
# RSSフィード内の各要素（記事）

class Entry
  # @!attribute [rw] title
  # @!attribute [rw] link
  # @!attribute [rw] description
  # @!attribute [rw] date
  attr_accessor :id, :title, :link, :description, :date

  # インスタンスの作成
  # @param [String] title
  # @param [String] description
  # @param [String] date
  # @param [String] link
  # @return [Entry] Entryクラスのインスタンス
  def initialize(id, title, description, date, link)
    @id = id
    @title = title
    @description = description
    @date = date
    @link = link
  end

end
