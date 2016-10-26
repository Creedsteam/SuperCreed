do
function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then
 return "No connection"
  end
local jdat = json:decode(url)
local answers = {'https://assets.imgix.net/examples/clouds.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/examples/redleaf.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/examples/blueberries.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/examples/butterfly.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/examples/espresso.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/transport.jpg?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/coffee.JPG?blur=120&w=700&h=400&fit=crop&txt=',
                   'https://assets.imgix.net/unsplash/citystreet.jpg?blur=120&w=700&h=400&fit=crop&txt=',
           'http://assets.imgix.net/examples/vista.png?blur=120&w=700&h=400&fit=crop&txt='}

local fonts = {'American%20Typewriter%2CBold','Arial%2CBoldItalicMT','Arial%2CBoldMT','Athelas%2CBold',
               'Baskerville%2CBoldItalic','Charter%2CBoldItalic','DIN%20Alternate%2CBold','Gill%20Sans%2CUltraBold',
         'PT%20Sans%2CBold','Seravek%2CBoldItalic','Verdana%2CBold','Yuanti%20SC%2CBold','Avenir%20Next%2CBoldItalic',
         'Lucida%20Grande%2CBold','American%20Typewriter%20Condensed%2CBold','rial%20Rounded%20MT%2CBold','Chalkboard%20SE%2CBold',
         'Courier%20New%2CBoldItalic','Charter%20Black%2CItalic','American%20Typewriter%20Light'}

local colors = {'00FF00','6699FF','CC99CC','CC66FF','0066FF','000000','CC0066','FF33CC','FF0000','FFCCCC','FF66CC','33FF00','FFFFFF','00FF00'}
local f = fonts[math.random(#fonts)]
local c = colors[math.random(#colors)]

local url = answers[math.random(#answers)]..jdat.ENtime.."&txtsize=200&txtclr="..c.."&txtalign=middle,center&txtfont="..f.."%20Condensed%20Medium&mono=ff6598cc=?markscale=60&markalign=center%2Cdown&mark64=QFVCX0NICg"
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
end
return {
  patterns = {
     "^([Tt]ime)$",
  "^([!/#][Tt]ime)$",
  },
  run = run
}

end