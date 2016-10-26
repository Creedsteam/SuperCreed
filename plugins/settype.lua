local function run(msg, matches)
 local data = load_data(_config.moderation.data)
 local group_type = data[tostring(msg.to.id)]['group_type']
 if matches[1] and is_sudo(msg) then
 data[tostring(msg.to.id)]['group_type'] = matches[2]
 save_data(_config.moderation.data, data)
 return 'Group Type Changed to : '..matches[2]
else 
return 'you are not sudo'
 end
 end
 return {
 patterns = {
 "^[#!/](settype) (.*)$",
 },
 run = run
 }