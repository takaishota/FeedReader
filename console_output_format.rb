# 標準出力用の整形機能を定義したモジュール/
# 各フォーマッターに読み込んで使用する

module ConsoleOutputFormat

  # フィードオブジェクトを標準出力用に整形して文字列として返す
  # @param [Feed] feed フィード
  # @return [String]  フォーマットされたフィード
  def format(feed)

    formatted_feed = ''
    # フィードのタイトル部分を表示
    formatted_feed << "#{feed.title}\n---\n"

    entries = ""
    feed.entries.each_with_index do |item, i|
      entry = Entry.new(i, item.title, item.description, item.date, item.link)

      # エントリを整形(指定した文字数にカット、カットされている箇所に...を付加、本文のHTMLタグを除外)
      formatted_title = entry.title ? entry.title.slice(0..@title_count) : ""
      formatted_title << "..." if formatted_title && @title_count < entry.title.split(//).size
      formatted_description = entry.description ? entry.description.gsub(/<("[^"]*"|'[^']*'|[^'">])*>/, "").strip.slice(0..@description_count) : ""
      formatted_description << "..." if formatted_description && @description_count < formatted_description.split(//).size

      entries << "#{(entry.id + 1).to_s} : #{formatted_title}\n #{formatted_description}\n"
    end

    formatted_feed << "#{entries}\n"
  end
end
