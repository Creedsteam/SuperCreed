local function run(msg,matches) 
if matches[1] == 'reply' then 
reply_msg(msg.reply_id, matches[2], ok_cb, false) 
end 
end 
 
return { 
patterns = {  
'^[#!/]([Rr]eply) (.*)$', 
}, 
run = run, 
}