function cj
  if count $argv = 2
    set file $argv[1]
    set endpoint $argv[2]
    set curl_command "curl -X POST -H \"Content-Type: application/json\" -d @$file \"http://$IP/$endpoint\""
    echo $curl_command
    eval $curl_command
  else
    echo "Expected two arguments, `file` `endpoint`"
  end
end
