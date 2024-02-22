{
  window = let
    float = [
      "mpv"
      "rofi"
      "kitty"
      "blueman"
      "g4music"
      "swayimg"
      "pavucontrol"

      "showmethekey"
      "com.github.Aylur.ags"

      "title: floating"
      "title:^(Save As)$"
      "title:^(Library)$"
      "title:^(Open File)$"
      "title:^(Open Folder)$"
      "title:^(Select a File)$"
      "title:^(Picture-in-Picture)$"
    ];
  in [
    "fakefullscreen, firefox"
    "opacity, 1.0, floating"
    "opacity, 0.8, spicetify"
    "pin, title:^(Picture-in-Picture)$"
  ] ++ (map (i: "float, ${i}") float);

  layer = [ ];
}
