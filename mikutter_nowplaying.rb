# -*- coding: utf-8 -*-

Plugin.create(:mikutter_nowplaying) do
  command(:now_playing_itunes,
          name: 'Now Playing',
          condition: lambda{ |opt| true },
          visible: true,
          role: :postbox
          ) do |opt|
    track = `osascript -e 'tell application "iTunes"' \
            -e 'name of current track' \
            -e 'end tell'`.chomp
    album = `osascript -e 'tell application "iTunes"' \
            -e 'album of current track' \
            -e 'end tell'`.chomp
    artist = `osascript -e 'tell application "iTunes"' \
             -e 'artist of current track' \
             -e 'end tell'`.chomp
    text = "#NowPlaying: \"#{track}\" from \"#{album}\" (#{artist})"
    Plugin[:gtk].widgetof(opt.widget).widget_post.buffer.text = text
  end
end
