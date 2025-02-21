function cdelete
  if [ (count $argv) -ge 1 ]

    set endpoint $argv[1]

    # Prepare the curl command
    set curl_command "curl -s -S -X DELETE \"http://$IP/$endpoint\" 2>/dev/null"

    eval $curl_command
  else
    echo "Expected at least one argument, `endpoint`"
  end
end
