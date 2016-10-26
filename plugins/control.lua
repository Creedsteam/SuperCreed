
local function run(msg, matches)

if matches[1]:lower() == 'join' and matches[2] and is_admin(msg) then
        channel_invite('channel#id'..matches[2], 'user#id'..msg.from.id, ok_cb, false)
      end
	  

  if matches[1]:lower() == '1m' and matches[2] then
    if not is_sudo(msg) then return end
    local time = os.time()
    local buytime = tonumber(os.time())
    local timeexpire = tonumber(buytime) + (tonumber(1 * 30) * 86400)
    redis:hset('expiretime','channel#id'..matches[2],timeexpire)
    enable_channel('channel#id'..matches[2])
    send_large_msg('channel#id'..matches[2], 'Group charged For 30 Days', ok_cb, false)
    return reply_msg(msg.id, 'Done', ok_cb, false)
  end
  if matches[1]:lower() == '3m' and matches[2] then
    if not is_sudo(msg) then return end
    local time = os.time()
    local buytime = tonumber(os.time())
    local timeexpire = tonumber(buytime) + (tonumber(3 * 30) * 86400)
    redis:hset('expiretime','channel#id'..matches[2],timeexpire)
    enable_channel('channel#id'..matches[2])
    send_large_msg('channel#id'..matches[2], 'Group charged For 90 Days', ok_cb, false)
    return reply_msg(msg.id, 'Done', ok_cb, false)
  end
  if matches[1]:lower() == 'unlimit' and matches[2] then
    if not is_sudo(msg) then return end
    local time = os.time()
    local buytime = tonumber(os.time())
    local timeexpire = tonumber(buytime) + (tonumber(2 * 99999999999) * 86400)
    redis:hset('expiretime','channel#id'..matches[2],timeexpire)
    enable_channel('channel#id'..matches[2])
    send_large_msg('channel#id'..matches[2], 'Group charged For unlimited', ok_cb, false)
    return reply_msg(msg.id, 'Done', ok_cb, false)
  end

    if matches[1]:lower() == 'leave' and matches[2] and is_sudo(msg) then
                          leave_channel('channel#id'..matches[2], ok_cb, false)
                          apileavechat(msg, '-100'..matches[2])
                      return 'Done\nI Exited the Group : '..matches[2]
                  elseif matches[1]:lower() == 'leave' and not matches[2] and is_admin(msg) then
                    leave_channel('channel#id'..msg.to.id, ok_cb, false)
                    apileavechat(msg, '-100'..msg.to.id)
                  end 

end
return {
  patterns = {
    "^[/!#](1[Mm])(%d+)(.*)$",
	"^[/!#](3[Mm])(%d+)(.*)$",
	 "^[/!#]([Jj]oin)(%d+)$",
    "^[/!#]([Uu]nlimite)(%d+)$",
    "^[/!#]([Ll]eave)(%d+) (.*)$",
		
		},
  run = run,
  }