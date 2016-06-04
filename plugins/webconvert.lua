
local function run(msg, matches) 

If matches[1]  == "html"  then
local file = io.open(". /platinum/covertor/script.html", "w") 
local text = matches[2]
text = text.."<i>Platinum</i> <b>Legend team Project</b>" 
file:write(text) 
file:flush() 
file:close() 
send_document(get_receiver(msg),  ". /platinum/converter/script.html", ok_cb, false)
end
if matches[1] == "php" then
local file = io.open("./platinum/converter/script.php", "w") 
local text = "<?php" 
text = text.."echo "..matches[2] 
text = text.."?>" 
file:write(text) 
file:flush() 
file:close() 
send_document(get_receiver(msg), ". /platinum/converter/script.php", ok_cb, false) 
end
end

return {
description = "Convertor for web",
usage = {
"/to php [html] : تبدیل کد به php",
"/to htm [html] : تبدیل کد به html",
"/to asp [html] : تبدیل کد به asp",
},
patterns = {
  "^/to (.*) (.*)$"
}, 
run = run, 
}