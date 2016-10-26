do
 function run(msg, matches)
local to = msg.to.type
local receiver = get_receiver(msg)
if to == 'channel' then
send_large_msg(receiver, "Please use /start command in private . [ Send it for @Bot_Creed to be Guided]", ok_cb, true)
end
end
return {
patterns = {
"^[!/]([sS]tart)$",
},
run = run
}
end