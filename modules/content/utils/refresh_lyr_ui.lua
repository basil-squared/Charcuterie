CHAR.FUNC.refresh_lyr_UI = function(newtext)
      CHAR.G.lyrics.current_lyric  = newtext
      CHAR.UI.lyrics:recalculate()
end
