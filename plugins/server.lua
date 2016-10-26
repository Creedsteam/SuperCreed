do
    
function run(msg, matches)
  if matches[1] == "serverinfo" and is_sudo(msg) then
     local f = io.popen("sh /root/teleseed/data/cmd.sh") 
     return ( f:read("*a") ) 
  end
end
return {
  patterns = {
    "^[/!](serverinfo)"
  },
  run = run
}
end
