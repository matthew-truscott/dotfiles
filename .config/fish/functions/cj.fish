function cj
  if [ (count $argv) -ge 2 ]
    set file $argv[1]
    set endpoint $argv[2]
    set curl_command "curl -X POST -H \"Content-Type: application/json\" -d @\"$file\" \"http://$IP/$endpoint\""
    # Loop over remaining arguments starting from the third one and append to the curl command
    for arg in $argv[3..-1]
      set curl_command $curl_command $arg
    end
    echo $curl_command
    eval $curl_command
  else
    echo "Expected at least two arguments, `file` `endpoint`"
  end
end
