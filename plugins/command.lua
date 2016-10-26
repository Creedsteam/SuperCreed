
local BASE_FOLDER = "/"
local folder = ""

local function download_file(extra, success, result)
    vardump(result)
    local file = ""
    local filename = ""
    if result.media.type == "photo" then
        file = result.id
        filename = "somepic.jpg"
    elseif result.media.type == "document" then
        file = result.id
        filename = result.media.caption
    elseif result.media.type == "audio" then
        filename = "somevoice.ogg"
        file = result.id
    else
        return
    end
    local url = BASE_URL .. '/getFile?file_id=' .. file
    local res = HTTPS.request(url)
    local jres = JSON.decode(res)
    if matches[2] then
        filename = matches[2]
    end

    local download = download_to_file("https://api.telegram.org/file/bot" .. bot_api_key .. "/" .. jres.result.file_path, filename)
end

function run(msg, matches)
    if is_sudo(msg) then
        receiver = get_receiver(msg)
        if matches[1]:lower() == 'cd' then
            if not matches[2] then
                return 'ًں—‚ ط´ظ…ط§ ط¯ط± ظ¾ظˆط´ظ‡ ط§طµظ„غŒ ظ‡ط³طھغŒط¯'
            else
                folder = matches[2]
                return 'ًں“‚ ط´ظ…ط§ ط¯ط± ط§غŒظ† ظ¾ظˆط´ظ‡ ظ‡ط³طھغŒط¯ : \n' .. BASE_FOLDER .. folder
            end
        end
        if matches[1]:lower() == 'ls' then
            local action = io.popen('ls "' .. BASE_FOLDER .. folder .. '"'):read("*all")
            send_large_msg(receiver, action)
        end
		if matches[1]:lower() == 'shell' then
            local action = io.popen( matches[2] ):read("*all")
            send_large_msg(receiver, action)
        end
        if matches[1]:lower() == 'mkdir' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && mkdir \'' .. matches[2] .. '\''):read("*all")
            return 'âœ”ï¸ڈ ظ¾ظˆط´ظ‡ ط§غŒط¬ط§ط¯ ط´ط¯'
        end
        if matches[1]:lower() == 'rem' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && rm -f \'' .. matches[2] .. '\''):read("*all")
            return 'ًںڑ« ظپط§غŒظ„ ط­ط°ظپ ط´ط¯'
        end
        if matches[1]:lower() == 'cat' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && cat \'' .. matches[2] .. '\''):read("*all")
            send_large_msg(receiver, action)
        end
        if matches[1]:lower() == 'rmdir' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && rmdir \'' .. matches[2] .. '\''):read("*all")
            return 'â‌Œ ظ¾ظˆط´ظ‡ ط­ط°ظپ ط´ط¯'
        end

        if matches[1]:lower() == 'touch' and matches[2] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && touch \'' .. matches[2] .. '\''):read("*all")
            return 'ط§غŒط¬ط§ط¯ ط´ط¯'
        end
        if matches[1]:lower() == 'tofile' and matches[2] and matches[3] then
            local file = io.open(BASE_FOLDER .. folder .. matches[2], "w")
            file:write(matches[3])
            file:flush()
            file:close()
            send_large_msg(receiver, (''))
        end
        if matches[1]:lower() == 'vps' and matches[2] then
            local text = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && ' .. matches[2]:gsub('â€”', '--')):read('*all')
            send_large_msg(receiver, text)
        end
        if matches[1]:lower() == 'cp' and matches[2] and matches[3] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && cp -r \'' .. matches[2] .. '\' \'' .. matches[3] .. '\''):read("*all")
            return 'ًں”ƒ ظپط§غŒظ„ ظ…ظˆط±ط¯ ظ†ط¸ط± ع©ظ¾غŒ ط´ط¯'
        end
        if matches[1]:lower() == 'mv' and matches[2] and matches[3] then
            local action = io.popen('cd "' .. BASE_FOLDER .. folder .. '" && mv \'' .. matches[2] .. '\' \'' .. matches[3] .. '\''):read("*all")
            return 'âœ‚ï¸ڈ ظپط§غŒظ„ ظ…ظˆط±ط¯ ظ†ط¸ط± ط§ظ†طھظ‚ط§ظ„ غŒط§ظپطھ'
        end
        if matches[1]:lower() == 'upload' and matches[2] then
            if io.popen('find ' .. BASE_FOLDER .. folder .. matches[2]):read("*all") == '' then
                return matches[2] .. ' âپ‰ï¸ڈ ط¯ط±ط³ ط³ط±ظˆط± ظ…ظˆط¬ظˆط¯ ظ†غŒط³طھ'
            else
                send_document(receiver, BASE_FOLDER .. folder .. matches[2], ok_cb, false)
                return 'ط¯ط± ط­ط§ظ„ ط§ط±ط³ط§ظ„'
            end
        end
        if matches[1]:lower() == 'download' then
            if type(msg.reply_id) == "nil" then
                return 'غŒع© ظپط§غŒظ„ ط±ط§ ط±غŒظ¾ظ„غŒ ع©ظ†غŒط¯ طھط§ ظ…ظ† ط¢ظ† ط±ط§ ط¯ط§ظ†ظ„ظˆط¯ ع©ظ†ظ…'
            else
                vardump(msg)
                get_message(msg.reply_id, download_file, false)
                return 'ط¯ط§ظ†ظ„ظˆط¯ ط´ط¯'
            end
        end
    else
        return 'ظپظ‚ط· ظ…ط®طµظˆطµ ط³ظˆط¯ظˆ ظ…غŒ ط¨ط§ط´ط¯'
    end
end

return {
    description = "FILEMANAGER",
    usage =
    {
        "SUDO",
        "#cd [<directory>]: Sasha entra in <directory>, se non أ¨ specificata torna alla cartella base.",
        "#ls: Sasha manda la lista di file e cartelle della directory corrente.",
        "#mkdir <directory>: Sasha crea <directory>.",
        "#rmdir <directory>: Sasha elimina <directory>.",
        "#rm <file>: Sasha elimina <file>.",
        "#cat <file>: Sasha manda il contenuto di <file>.",
        "#tofile <file> <text>: Sasha crea <file> con <text> come contenuto.",
        "#vps <command>: Sasha esegue <command>.",
        "#cp <file> <directory>: Sasha copia <file> in <directory>.",
        "#mv <file> <directory>: Sasha sposta <file> in <directory>.",
    },
    patterns =
    {
        "^[$#]([Cc][Dd])$",
        "^[$#]([Cc][Dd]) (.*)$",
		"^[$#]([Ss]hell) (.*)$",
        "^[$#]([Ll][Ss])$",
        "^[$#]([Mm][Kk][Dd][Ii][Rr]) (.*)$",
        "^[$#]([Rr][Mm][Dd][Ii][Rr]) (.*)$",
        "^[$#]([Rr][Ee][Mm]) (.*)$",
        "^[$#]([Cc][Aa][Tt]) (.*)$",
        "^[$#]([Vv][Pp][Ss]) (.*)$",
        "^[$#]([Cc][Pp]) (.*) (.*)$",
        "^[$#]([Mm][Vv]) (.*) (.*)$",
        "^[$#]([Uu][Pp][Ll][Oo][Aa][Dd]) (.*)$",
        "^[$#]([Dd][Oo][Ww][Nn][Ll][Oo][Aa][Dd]) (.*)",
        "^[$#]([Dd][Oo][Ww][Nn][Ll][Oo][Aa][Dd])"
    },
    run = run,
    min_rank = 5
}

--by @specialteam_ch
--tnx to negativ