function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'
  # then override everything you want! note that these must be defined with `set -x`
  set -x black   000000
  set -x white   FFFFFF
  set -x lgrey   D0D0D0
  set -x dgrey   B3B3B3
  set -x lpink   CC58CC
  set -x lpurple CF44DB
  set -x lgreen  55D455
  set -x lorange FACD39
  set -x lred    D64747

  set -x color_repo           $lgreen  $black
  set -x color_repo_work_tree $lgreen  $black
  set -x color_repo_staged    $lorange $black
  set -x color_repo_dirty     $lred    $black

  set -x color_path           $dgrey $black
  set -x color_path_basename  $dgrey $black --bold
  #  set -x color_path_nowrite_basename magenta $colorfg --bold
end
