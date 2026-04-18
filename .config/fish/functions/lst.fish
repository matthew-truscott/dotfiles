function lst
  eza -l --git -T -L 2 --ignore-glob="*.pyc|*.o|*.make|*.cmake" --hyperlink --header $argv
end
