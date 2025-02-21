function cpost
  if [ (count $argv) -ge 2 ]

    set file $argv[1]
    set endpoint $argv[2]
    set num_args (count $argv)

    if [ $num_args -gt 2 ]
      set json_body (cat $file)
      # Loop over remaining arguments starting from the third one
      for i in (seq 1 (math "$num_args - 2"))  # Generate indices 0 to num_args - 1
        set arg_index (math "$i + 2")  # Get the index of the argument to inject
        set j (math "$i - 1")  # Get the index of the placeholder
        set inject_var "\"$argv[$arg_index]\""  # Get the value to inject
        set placeholder "{{"$j"}}"  # Create the placeholder (e.g., {{0}}, {{1}}, etc.)
        set json_body (string replace $placeholder "$inject_var" "$json_body")  # Replace the placeholder
      end
      set curl_command "curl -s -S -X POST -H \"Content-Type: application/json\" -H \"Authorization: Bearer $TOKEN\" -d '$json_body' \"http://$IP/$endpoint\" 2>/dev/null"
    else
      set curl_command "curl -s -S -X POST -H \"Content-Type: application/json\" -H \"Authorization: Bearer $TOKEN\" -d '@$file' \"http://$IP/$endpoint\" 2>/dev/null"
    end

    # Prepare the curl command

    # Loop over remaining arguments starting from the third one and append to the curl command
    for arg in $argv[3..-1]
      set curl_command $curl_command $arg
    end

    eval $curl_command
  else
    echo "Expected at least two arguments, `file` `endpoint`"
  end
end
