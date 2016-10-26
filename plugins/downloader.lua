local function run(msg, matches)
local url = matches[1]
local name = matches[2]
local file = download_to_file(url,name)
send_document('channel#id'..msg.to.id,file,ok_cb,false)
send_document('chat#id'..msg.to.id,file,ok_cb,false)
end
return {
    patterns = {
        "[!/#]([Dd][Ll]) (.*) (.*)"
        },
    run = run
    }
