local function run(msg, matches)
if is sudo(msg) and matches[1] == 'backup' then
    local cmd = io.popen('sudo tar -cpf DJ.tar *') — اینجا نام پوشه را بگذارید
      cmd:read('*all')
      cmd:close()
      send_document(msg.from.id, './DJ.tar') — اینجا هم همینطور
      end

return {
patterns = {
"^[!/#$]([Bb][Aa][Cc][Kk][Uu][Pp]$",
},
run = run
}
