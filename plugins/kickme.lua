local function run(msg, matches)
if matches[1] == 'kickme' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "wait")
      return 'Dear User :  [ '..msg.from.username..' ]\nIf You want to go Please Type :  <code>yes</code>\nand if you want to Stay Type : <code>no</code> \n'
    end

    if msg.text then
 local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^(yes)$") and redis:get(hash) == "wait" then
   redis:set(hash, "ok")
 elseif msg.text:match("^no$") and redis:get(hash) == "wait" then
 send_large_msg(get_receiver(msg), "Kickme Status : <code>No</code>\nYou are in !")
   redis:del(hash, true)

      end
    end
 local hash = 'kick:'..msg.to.id..':'..msg.from.id
  if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return  'Kickme Status : <code>Yes</code>\nUser <code>('..msg.from.id..')</code> Have Been Kicked !'
        end
      end
    end

return {
  patterns = {
  "^([Kk]ickme)$",
  "^[/!]([Kk]ickme)$",
  "^([Yy]es)$",
  "^([Nn]o)$"
  },
  run = run,
}