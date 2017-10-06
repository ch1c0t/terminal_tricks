require 'toui'

Toui::App.new do
  input :query do
    on :tab do
      sentences.hide
      autocompletions.show
    end
    on :enter do
      autocompletions.hide
      sentences.show
    end
  end

  view :autocompletions do ["autocomplete for #{query}", "query", query] end
  view :sentences do ["A sentence with #{query}", "query", query] end
end.run
