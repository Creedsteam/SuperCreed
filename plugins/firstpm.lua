do
 function run(msg, matches)
local to = msg.to.type
local receiver = get_receiver(msg)
if to == 'user' then
send_large_msg(receiver, "به پیوی من خوش آمدی دوست عزیزم\nبرای دیدن لیست دستوراتم بزن : /help\nبرای ربات تبدیل عکس به استیکر و استیکر به عکس برو به : @StickerToPhoto_Bot\n\nتوی کانال جوین بده هرچیزی بشه میزاریم اونجا همچنین اولین و جالبترین رباتای تلگرامم میزاریم اونجا : @Ir_Team", ok_cb, true)
end
end
return {
patterns = {
"^[!/]([sS]tart)$",
"^(سلام)$",
"^([Ss]lm)$",
"^([Hh][Ii])$",
"^(الو)$",
},
run = run
}
end