local function run(msg, matches)
      local pm = msg.id
      local data = load_data(_config.moderation.data)
                  local gid = data['fwdgroup']

      if matches[1] == 'fwdall' and not matches[2] and is_sudo(msg) then
      data['f2a'] = 'waiting'
      save_data(_config.moderation.data, data)
      return "Send me Forwarding message !"
    end
    if data and data['f2a'] == 'waiting' and is_sudo(msg) then
      local groups = 'groups'
      for k,v in pairs(data[tostring(groups)]) do
        chat_id =  v
        local chat = 'chat#id'..chat_id
        local channel = 'channel#id'..chat_id
      fwd_msg(chat,pm,ok_cb,false)
      fwd_msg(channel,pm,ok_cb,false)
      data['f2a'] = 'close'
      save_data(_config.moderation.data, data)
      end
  end
end
return {
       usage = {
              sudo = {
               "/Fwd : Forward Text to groups "
        },
     },
     
     fausage = {
              sudo = {
               "/Fwd : فورواد پیام به همه گروه ها "
        },
     },
  patterns = {
    "^[#/!](fwdall)$",
    "(.*)"
  },
  run = run
}