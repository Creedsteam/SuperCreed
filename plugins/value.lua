local function get_variables_hash(msg)
  if msg.to.type == 'chat' or msg.to.type == 'channel' then
    return 'chat:bot'..msg.to.id..':variables'
  end
end 

local function get_value(msg, var_name)
  local hash = get_variables_hash(msg)
  if hash then
    local value = redis:hget(hash, var_name)
    if not value then
      return
    else
  reply_msg(msg['id'], value, ok_cb, true)
    end
  end
end


local function list_chats(msg)
  local hash = get_variables_hash(msg)

  if hash then
    local names = redis:hkeys(hash)
    local text = 'bot replyes :\n-----------\n'
    m = 1
    for i=1, #names do
      text = text..m..' > '..names[i]..'\n'
      m = m + 1
    end
  reply_msg(msg['id'], text, ok_cb, true)
 else
 return 
  end
end


local function save_value(msg, name, value)
  if (not name or not value) then
   reply_msg(msg['id'], "How to user\n!value + name value", ok_cb, true)
  end
  local hash = nil
  if msg.to.type == 'chat' or msg.to.type == 'channel'  then
    hash = 'chat:bot'..msg.to.id..':variables'

  end
  if hash then
    redis:hset(hash, name, value)
          reply_msg(msg['id'], "["..name.."] Saved", ok_cb, true)
  end
end
local function del_value(msg, name)
  if not name then
    return
  end
  local hash = nil
  if msg.to.type == 'chat' or msg.to.type == 'channel'  then
    hash =  'chat:bot'..msg.to.id..':variables'
  end
  if hash then
    redis:hdel(hash, name)
      reply_msg(msg['id'],  "["..name.."] Removed", ok_cb, true)
  end
end

local function delallchats(msg)
  local hash =  'chat:bot'..msg.to.id..':variables'

  if hash then
    local names = redis:hkeys(hash)
    for i=1, #names do
      redis:hdel(hash,names[i])
    end
      reply_msg(msg['id'],"Done!", ok_cb, true)
 else
 return 
  end
end





local function run(msg, matches)
 if is_owner(msg) then
    local name = matches[3]
  local value = matches[4]
  if matches[1] == "value" and matches[2] == 'clean' then
    local output = delallchats(msg)
    return output
  end
  if matches[2] == '+' then
  local name1 = user_print_name(msg.from)
  local text = save_value(msg, name, value)
  return text
    elseif matches[2] == '-' then
    local text = del_value(msg,name)
    return text
    end
 end
  if matches[1] == 'value' and matches[2] == "list" then
    local output = list_chats(msg)
    return output
  else
    local name = user_print_name(msg.from)
    return get_value(msg, matches[1]:lower())
  end
end

return {
  patterns = {
    "^[!/#](value) (list)$",
    "^[#!/](value) (clean)$",
    "^[#!/](value) (+) ([^%s]+) (.+)$",
    "^[#!/](value) (-) (.*)$",
    "^(.+)$",
  },
  run = run
}