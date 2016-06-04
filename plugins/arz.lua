local function get_arz(ln)
  local url = 'http://exchange.nalbandan.com/api.php?action=json'
  local jstr, res = HTTP.request(url)
  local arz = json:decode(jstr)
  local text = make_text(lang[ln].arz.desc1,arz.dollar.date,arz.gold_per_geram.value,arz.coin_new.value,arz.coin_old.value,arz.dollar.value,arz.dollar_rasmi.value)..make_text(lang[ln].arz.desc2,arz.euro.value,arz.pond.value,arz.derham.value)
  return text
end

local action = function(msg, matches, ln)
  local text
  text = get_arz(ln) 
  api.sendReply(msg, text, true)
end
local iaction = function(inline, matches)
  local text = get_arz(matches[2]) 
  local photo1_url = 'http://www.ana.ir/Media/Image/1394/06/03/635761110354222411_M.jpg'
	local qresult = {{}}
	qresult[1].id= inline.id
	qresult[1].title = 'Arz'
	qresult[1].type = 'article'
	qresult[1].description = 'Arz in iran ...'
	qresult[1].thumb_url = photo1_url
	qresult[1].message_text = URL.escape(text)
	api.sendInline(inline.id, qresult)
end
local on_each_inline = function(inline,ln,each_count)
  local text = get_arz(ln) 
  local photo1_url = 'http://www.ana.ir/Media/Image/1394/06/03/635761110354222411_M.jpg'
	local qresult = {}
	qresult.id= inline.id
	qresult.title = 'Arz'
	qresult.type = 'article'
	qresult.description = 'Arz in iran ...'
	qresult.thumb_url = photo1_url
	qresult.message_text = URL.escape(text)
	return qresult
	end
local triggers = {
    "^[!/](arz)$"
  }
local itriggers = {
    "^(arz) (fa)$",
    "^(arz) (en)$"
  }
return {
  action = action,
  triggers = triggers,
  iaction = iaction,
  itriggers = itriggers,
  on_each_inline = on_each_inline
}
