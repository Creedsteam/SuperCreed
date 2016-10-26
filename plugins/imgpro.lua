do
function run(msg, matches)
local text1 = matches[1]
local text2 = matches[2]
local text3 = matches[3]
if not matches[2] then
  text2 = " "
  end
if not matches[3] then
  text3 = " "
  end
if not matches[2] and not matches[3] then
  text2 = " "
  text3 = " "
  end
  text4 = "@IR_TEAM"
  local url = URL.escape(text1.." "..text2.." "..text3)

  local answers = {'https://assets.imgix.net/examples/clouds.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/examples/redleaf.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/examples/blueberries.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/examples/butterfly.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/examples/espresso.jpg?blur=200&w=1000&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/transport.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/coffee.JPG?blur=200&w=1300&h=600&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/citystreet.jpg?blur=200&w=1300&h=600&fit=crop&txt=',
           'http://assets.imgix.net/examples/vista.png?blur=200&w=1300&h=600&fit=crop&txt='}

local fonts = {'American%20Typewriter%2CBold','Arial%2CBoldItalicMT','Arial%2CBoldMT','Athelas%2CBold',
               'Baskerville%2CBoldItalic','Charter%2CBoldItalic','DIN%20Alternate%2CBold','Gill%20Sans%2CUltraBold',
         'PT%20Sans%2CBold','Seravek%2CBoldItalic','Verdana%2CBold','Yuanti%20SC%2CBold','Avenir%20Next%2CBoldItalic',
         'Lucida%20Grande%2CBold','American%20Typewriter%20Condensed%2CBold','rial%20Rounded%20MT%2CBold','Chalkboard%20SE%2CBold',
         'Courier%20New%2CBoldItalic','Charter%20Black%2CItalic','American%20Typewriter%20Light'}

local colors = {'00FF00','6699FF','CC99CC','CC66FF','0066FF','000000','CC0066','FF33CC','FF0000','FFCCCC','FF66CC','33FF00','FFFFFF','00FF00'}

local f = fonts[math.random(#fonts)]

local c = colors[math.random(#colors)]

local url = answers[math.random(#answers)]..url.."&txtsize=120&txtclr="..c.."&txtalign=middle,center&txtfont="..f.."%20Condensed%20Medium&mono=ff6598cc=?markscale=60&markalign=center%2Cdown&mark64=QFVCX0NICg"
  
local randoms = math.random(1000,900000)
local randomd = randoms..".jpg"
local cb_extra = {file_path=file}
local receiver = get_receiver(msg)
local file = download_to_file(url,randomd)
 send_photo(receiver, file, rmtmp_cb, cb_extra)

end
return {
  patterns = {
    "^[/#!]imagepro (.+) (.+) (.+) (.+) (.+)$",
    "^[/#!]imagepro (.+) (.+) (.+) (.+)$",
  "^[/#!]imagepro (.+) (.+) (.+)$",
  "^[/#!]imagepro (.+) (.+)$",
    "^[/#!]imagepro (.+)$",
  },
  run = run
}

end