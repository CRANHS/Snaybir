
------------------------------------------------ 
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︰ awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua SNAYBIR.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua SNAYBIR.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua SNAYBIR.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local TheSNAYBIR = io.open("TheSNAYBIR", 'w')
TheSNAYBIR:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
sudo lua5.3 SNAYBIR.lua
done
]])
TheSNAYBIR:close()
local Run = io.open("Run", 'w')
Run:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
screen -S TheSNAYBIR -X kill
screen -S TheSNAYBIR ./TheSNAYBIR
done
]])
Run:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x TheSNAYBIR;chmod +x Run;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
TheSNAYBIR = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheSNAYBIR)
LuaTele = luatele.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=TheSNAYBIR,token=Token}
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos ={Sudo_Id,474380639}  
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
end
return ControllerAll
end
function Controllerbanall(ChatId,UserId)
Status = 0
DevelopersQ = Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
if UserId == 474380639 then
Status = true
elseif UserId == 474380639 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == TheSNAYBIR then
Status = true
elseif DevelopersQ then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
Developers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) 
DevelopersQ = Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
TheBasics = Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..ChatId,UserId)
TheBasicsQ = Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 474380639 then
Status = 'مبرمج السورس'
elseif UserId == 474380639 then
Status = 'مطور السورس'
elseif UserId == Sudo_Id then  
Status = 'المطور الاساسي'
elseif UserId == TheSNAYBIR then
Status = 'البوت'
elseif DevelopersQ then
Status = 'المطور الثانوي'
elseif Developers then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Developer:Bot:Reply"..ChatId) or 'المطور'
elseif TheBasicsQ then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:PresidentQ:Group:Reply"..ChatId) or 'المالك'
elseif TheBasics then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:President:Group:Reply"..ChatId) or 'المنشئ الاساسي'
elseif Originators then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Constructor:Group:Reply"..ChatId) or 'المنشئ'
elseif Managers then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Manager:Group:Reply"..ChatId) or 'المدير'
elseif Addictive then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Admin:Group:Reply"..ChatId) or 'الادمن'
elseif StatusMember == "chatMemberStatusCreator" then
Status = 'مالك المجموعه'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = 'ادمن المجموعه'
elseif Distinguished then
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Vip:Group:Reply"..ChatId) or 'المميز'
else
Status = Redis:get(TheSNAYBIR.."SNAYBIR:Mempar:Group:Reply"..ChatId) or 'العضو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 44 then  
Status = 'المالك'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
else
Status = 'المميز'
end  
return Status
end 
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = LuaTele.getChatMember(ChatId,user2).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local reply_markupp = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات المجموعه : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- حذف الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"𖤓︙ صلاحيات الادمن - ", 'md', false, false, reply_markupp)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = LuaTele.getChatMember(ChatId,UserId).status
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(TheSNAYBIR.."SNAYBIR:lockpin"..ChatId) then    
lock_pin = "✔️"
else 
lock_pin = "❌"    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..ChatId) then    
lock_tagservr = "✔️"
else 
lock_tagservr = "❌"
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:text"..ChatId) then    
lock_text = "✔️"
else 
lock_text = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✔️"
else 
lock_add = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Join"..ChatId) == "kick" then
lock_join = "✔️"
else 
lock_join = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:edit"..ChatId) then    
lock_edit = "✔️"
else 
lock_edit = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Chek:Welcome"..ChatId) then
welcome = "✔️"
else 
welcome = "❌ "    
end
if Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقيد "     
elseif Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✔️"
else     
flood = "❌ "     
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId) == "del" then
lock_photo = "✔️" 
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقيد "   
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId) == "del" then
lock_phon = "✔️" 
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId) == "del" then
lock_links = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId) == "del" then
lock_user = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId) == "del" then
lock_hash = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "del" then
lock_muse = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId) == "del" then
lock_ved = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId) == "del" then
lock_gif = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId) == "del" then
lock_ste = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId) == "del" then
lock_geam = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "del" then
lock_vico = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقيد "
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId) == "del" then
lock_fwd = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId) == "del" then
lock_file = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId) == "del" then
lock_self = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقيد "   
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId) == "del" then    
lock_spam = "✔️"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقيد "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'تفاعل محلو 😤' 
elseif tonumber(Message) < 200 then 
MsgText = 'تفاعلك ضعيف ليش'
elseif tonumber(Message) < 400 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 700 then 
MsgText = 'شكد تحجي😒' 
elseif tonumber(Message) < 1200 then 
MsgText = 'ملك التفاعل 😼' 
elseif tonumber(Message) < 2000 then 
MsgText = 'موش تفاعل غنبله' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اساس لتفاعل ياب'  
elseif tonumber(Message) < 4000 then 
MsgText = 'عوف لجواهر وتفاعل بزودك' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(Message) < 5500 then 
MsgText = 'شهلتفاعل استمر يكيك' 
elseif tonumber(Message) < 7000 then 
MsgText = 'غنبله وربي 🌟' 
elseif tonumber(Message) < 9500 then 
MsgText = 'حلغوم مال تفاعل' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'تفاعل نار وشرار'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = LuaTele.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات المجموعه : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,MsgId,"𖤓︙ صلاحيات المجموعه - ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
BanAll = Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
if UserInfo.username then
UserInfousername = '['..UserInfo.first_name..'](t.me/'..UserInfo.username..')'
else
UserInfousername = '['..UserInfo.first_name..'](tg://user?id='..UserId..')'
end
return {
Lock     = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙بواسطه ˓ *'..UserInfousername..'\n*'..TextMsg..'\n𖤓︙خاصيه المسح *',
unLock   = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙بواسطه ˓ *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙بواسطه ˓ *'..UserInfousername..'\n*'..TextMsg..'\n𖤓︙خاصيه الكتم *',
lockKid  = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙بواسطه ˓ *'..UserInfousername..'\n*'..TextMsg..'\n𖤓︙خاصيه التقييد *',
lockKick = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙بواسطه ˓ *'..UserInfousername..'\n*'..TextMsg..'\n𖤓︙خاصيه الطرد *',
Reply    = '[𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT](https://t.me/IIH5I)\n*— — — — — — — — —\n𖤓︙المستخدم ˓ *'..UserInfousername..'\n*'..TextMsg..'*'
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 474380639 then
Status = true
elseif UserId == 474380639 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == TheSNAYBIR then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
DevelopersQ = Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
Developers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) 
TheBasics = Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..ChatId,UserId) 
Originators = Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..ChatId,UserId)
Managers = Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..ChatId,UserId)
Addictive = Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..ChatId,UserId)
Distinguished = Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..ChatId,UserId)
StatusMember = LuaTele.getChatMember(ChatId,UserId).status.luatele
if UserId == 474380639 then
Status = true
elseif UserId == 474380639 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif UserId == TheSNAYBIR then
Status = true
elseif DevelopersQ then
Status = true
elseif Developers then
Status = true
elseif TheBasics then
Status = true
elseif Originators then
Status = true
elseif Managers then
Status = true
elseif Addictive then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = LuaTele.getChatMember(msg.chat_id,TheSNAYBIR).status
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoin(msg)
JoinChannel = true
local Channel = Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender.user_id)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function File_Bot_Run(msg,data)  
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender.user_id
local msg_id = msg.id
local text = nil
if msg.sender.luatele == "messageSenderChat" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end

if msg.date and msg.date < tonumber(os.time() - 15) then
print("->> Old Message End <<-")
return false
end
if data.content.text then
text = data.content.text.text
end
if tonumber(msg.sender.user_id) == tonumber(TheSNAYBIR) then
print('This is reply for Bot')
return false
end
if Statusrestricted(msg.chat_id,msg.sender.user_id).BanAll == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).BanGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}),LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender.user_id).SilentGroup == true then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if tonumber(msg.sender.user_id) == 474380639 then
msg.Name_Controller = 'مبرمج السورس '
msg.The_Controller = 1
elseif tonumber(msg.sender.user_id) == 474380639 then
msg.Name_Controller = 'مطور السورس '
msg.The_Controller = 1
elseif The_ControllerAll(msg.sender.user_id) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'المطور الاساسي '
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",msg.sender.user_id) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطور الثانوي'
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",msg.sender.user_id) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Developer:Bot:Reply"..msg.chat_id) or 'المطور '
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:PresidentQ:Group:Reply"..msg.chat_id) or 'المالك'
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي'
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Constructor:Group:Reply"..msg.chat_id) or 'المنشئ '
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Manager:Group:Reply"..msg.chat_id) or 'المدير '
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Admin:Group:Reply"..msg.chat_id) or 'الادمن '
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg.chat_id,msg.sender.user_id) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Vip:Group:Reply"..msg.chat_id) or 'المميز '
elseif tonumber(msg.sender.user_id) == tonumber(TheSNAYBIR) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(TheSNAYBIR.."SNAYBIR:Mempar:Group:Reply"..msg.chat_id) or 'العضو '
end  
if msg.The_Controller == 1 then  
msg.ControllerBot = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.DevelopersQ = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Developers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.TheBasicsm = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.TheBasics = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Originators = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Managers = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Addictive = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Distinguished = true
end



if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:text"..msg_chat_id) and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Welcome"..msg_chat_id) then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Welcome = Redis:get(TheSNAYBIR.."SNAYBIR:Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{name}',UserInfo.first_name) 
Welcome = Welcome:gsub('{user}',UserInfousername) 
Welcome = Welcome:gsub('{NameCh}',Get_Chat.title) 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md")  
else
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙اطلق دخول ['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')\n𖤓︙نورت الكروب {'..Get_Chat.title..'}',"md")  
end
end
end
if not msg.Distinguished and msg.content.luatele ~= "messageChatAddMembers" and Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender.user_id) == tonumber(TheSNAYBIR) then
return false
end
local floods = Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(TheSNAYBIR.."SNAYBIR:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙قام بالتكرار في المجموعه وتم طرده").Reply,"md",true)
end
if type == "del" then 
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙قام بالتكرار في المجموعه وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙قام بالتكرار في المجموعه وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Spam:Cont"..msg.sender.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Distinguished then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if msg.forward_info and not msg.Distinguished then -- التوجيه
local Fwd_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Fwd_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Fwd_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Fwd_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is forward')
return false
end 

if msg.reply_markup and msg.reply_markup.luatele == "replyMarkupInlineKeyboard" then
if not msg.Distinguished then  -- الكيبورد
local Keyboard_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
var(LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id}))
elseif Keyboard_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Keyboard_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Keyboard_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
print('This is reply_markup')
end 

if msg.content.location and not msg.Distinguished then  -- الموقع
if location then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
end
print('This is location')
end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.luatele == "textEntityTypeUrl" and not msg.Distinguished then  -- الماركداون
local Markduan_Gtoup = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Markduan_Gtoup == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Markduan_Gtoup == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is textEntityTypeUrl')
end 

if msg.content.game and not msg.Distinguished then  -- الالعاب
local Games_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id)
if Games_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Games_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Games_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Games_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is games')
end 
if msg.content.luatele == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(TheSNAYBIR.."SNAYBIR:lockpin"..msg_chat_id)
if Pin_Msg and not msg.Managers then
if Pin_Msg:match("(%d+)") then 
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.luatele~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if UnPin.luatele ~= "ok" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙التثبيت معطل من قبل المدراء ","md",true)
end
print('This is message Pin')
end 

if msg.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Join"..msg.chat_id) == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end

if msg.content.luatele == "messageChatAddMembers" then -- اضافه اشخاص
print('This is Add Membeers ')
Redis:incr(TheSNAYBIR.."SNAYBIR:Num:Add:Memp"..msg_chat_id..":"..msg.sender.user_id) 
local AddMembrs = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
local Info_User = LuaTele.getUser(v) 
if Info_User.type.luatele == "userTypeBot" then
if Lock_Bots == "del" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
elseif Info_User.type.luatele == "userTypeRegular" then
Redis:incr(TheSNAYBIR.."SNAYBIR:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) 
if AddMembrs == "kick" and not msg.Distinguished then
LuaTele.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 

if msg.content.luatele == "messageContact" and not msg.Distinguished then  -- الجهات
local Contact_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Contact_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Contact_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Contact_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Contact')
end 

if msg.content.luatele == "messageVideoNote" and not msg.Distinguished then  -- بصمه الفيديو
local Videonote_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Videonote_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Videonote_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Videonote_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is video Note')
end 

if msg.content.luatele == "messageDocument" and not msg.Distinguished then  -- الملفات
local Document_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id)
if Document_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Document_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Document_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Document_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Document')
end 

if msg.content.luatele == "messageAudio" and not msg.Distinguished then  -- الملفات الصوتيه
local Audio_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Audio_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Audio_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Audio_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Audio')
end 

if msg.content.luatele == "messageVideo" and not msg.Distinguished then  -- الفيديو
local Video_Grouo = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Video_Grouo == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Video_Grouo == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Video_Grouo == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Video')
end 

if msg.content.luatele == "messageVoiceNote" and not msg.Distinguished then  -- البصمات
local Voice_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Voice_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Voice_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Voice_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Voice')
end 

if msg.content.luatele == "messageSticker" and not msg.Distinguished then  -- الملصقات
local Sticker_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Sticker_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Sticker_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Sticker_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Sticker')
end 

if msg.via_bot_user_id ~= 0 and not msg.Distinguished then  -- انلاين
local Inlen_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Inlen_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Inlen_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Inlen_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is viabot')
end

if msg.content.luatele == "messageAnimation" and not msg.Distinguished then  -- المتحركات
local Gif_group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Gif_group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Gif_group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Gif_group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Animation')
end 

if msg.content.luatele == "messagePhoto" and not msg.Distinguished then  -- الصور
local Photo_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Photo_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Photo_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Photo_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is Photo delete')
end
if msg.content.photo and Redis:get(TheSNAYBIR.."SNAYBIR:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id) then
local ChatPhoto = LuaTele.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.luatele == "error") then
Redis:del(TheSNAYBIR.."SNAYBIR:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا استطيع تغيير صوره المجموعه لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(TheSNAYBIR.."SNAYBIR:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تغيير صوره المجموعه المجموعه الى ","md",true)    
end
if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id)  
if not msg.Distinguished then
if link_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif link_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif link_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif link_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is link ')
return false
end
end
if text and text:match("@[%a%d_]+") and not msg.Distinguished then 
local UserName_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif UserName_Group == "ked" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif UserName_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif UserName_Group == "kick" then
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is username ')
end
if text and text:match("#[%a%d_]+") and not msg.Distinguished then 
local Hashtak_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Hashtak_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif Hashtak_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif Hashtak_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
print('This is hashtak ')
end
if text and text:match("/[%a%d_]+") and not msg.Distinguished then 
local comd_Group = Redis:get(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
return LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif comd_Group == "ked" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
elseif comd_Group == "ktm" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg.chat_id,msg.sender.user_id) 
elseif comd_Group == "kick" then
return LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
end
end
if (Redis:get(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id, text)  
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true1')
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'true1') then
local Text_Filter = Redis:get(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(TheSNAYBIR.."SNAYBIR:Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Text"..msg.sender.user_id..':'..msg_chat_id)  
Redis:del(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم اضافه رد التحذير","md",true)  
end
if text and (Redis:get(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(TheSNAYBIR.."SNAYBIR:Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Distinguished then
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.id})
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙لقد تم منع هذه ( "..statusfilter.." ) هنا*\n𖤓︙"..ReplyFilters,"md",true)   
end
end
if text and Redis:get(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id) == "true" then
local NewCmmd = Redis:get(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:New"..msg_chat_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Command:List:Group"..msg_chat_id,text)
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم ازالة هاذا ˓ { "..text.." }","md",true)
else
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد امر بهاذا الاسم","md",true)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id)
return false
end
if text and Redis:get(TheSNAYBIR.."SNAYBIR:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id) == "true" then
Redis:set(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(TheSNAYBIR.."SNAYBIR:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id)
Redis:set(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id,"true1") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id) == "true1" then
local NewCmd = Redis:get(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:New"..msg_chat_id)
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(TheSNAYBIR.."SNAYBIR:Command:List:Group"..msg_chat_id,text)
Redis:del(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:End"..msg_chat_id..":"..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ الامر باسم ˓ { "..text..' }',"md",true)
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Link"..msg_chat_id..""..msg.sender.user_id) then
if text == "الغاء" then
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"📥︰تم الغاء حفظ الرابط","md",true)         
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
Redis:set(TheSNAYBIR.."SNAYBIR:Group:Link"..msg_chat_id,LinkGroup)
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Link"..msg_chat_id..""..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"📥︰تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(TheSNAYBIR.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheSNAYBIR.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(TheSNAYBIR.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id)  
Redis:set(TheSNAYBIR.."SNAYBIR:Welcome:Group"..msg_chat_id,text) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ ترحيب المجموعه","md",true)     
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Group:Rules" .. msg_chat_id,text) 
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ قوانين المجموعه","md",true)  
end  
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" then 
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم الغاء حفظ وصف المجموعه","md",true)   
end 
LuaTele.setChatDescription(msg_chat_id,text) 
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ وصف المجموعه","md",true)  
end  
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheSNAYBIR.."SNAYBIR:Text:Manager"..msg.sender.user_id..":"..msg_chat_id.."")
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
print(idPhoto)
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ رد للمدير بنجاح \n𖤓︙ارسل ( "..test.." ) لرئية الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true1")
Redis:set(TheSNAYBIR.."SNAYBIR:Text:Manager"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Manager"..msg_chat_id.."", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender.user_id..'/chengreplyg'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT ⁦', url='https://t.me/IIH5I'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي الرد سواء كان 
- ملف ملصق 𖤓 متحركه 𖤓 صوره
• فيديو 𖤓 بصمه الفيديو 𖤓 بصمه 𖤓 صوت 𖤓 رساله - 
• يمكنك اضافة الى النص 𖤓
— — — — — — — — —
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد السحكات

]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Manager"..msg_chat_id.."", text)
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف الرد من ردود المدير ","md",true)  
return false
end
end
if text and Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..text)
local video = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..text)
local document = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..text)
local audio = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',UserInfo.first_name)
local Text = Text:gsub('#id',msg.sender.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Text,"md",true)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg_chat_id) then
local anemi = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local NumMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
LuaTele.sendText(msg_chat_id,msg_id,Texingt,"md",true)  
end
if video_note then
LuaTele.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
LuaTele.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
LuaTele.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
LuaTele.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
LuaTele.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
LuaTele.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
LuaTele.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
LuaTele.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(TheSNAYBIR.."SNAYBIR:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true1" then
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..test, idPhoto)  
end
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حفظ رد للمطور \n𖤓︙ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id) == "true" then
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id, "true1")
Redis:set(TheSNAYBIR.."SNAYBIR:Text:Sudo:Bot"..msg.sender.user_id..":"..msg_chat_id, text)
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo", text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender.user_id..'/chengreplys'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT ⁦', url='https://t.me/IIH5I'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,[[
• ارسل لي الرد سواء كان 
- ملف ملصق 𖤓 متحركه 𖤓 صوره
• فيديو 𖤓 بصمه الفيديو 𖤓 بصمه 𖤓 صوت 𖤓 رساله - 
• يمكنك اضافة الى النص 𖤓
— — — — — — — — —
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد السحكات

]],"md",true, false, false, false, reply_markup)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR:Set:On"..msg.sender.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(TheSNAYBIR..'SNAYBIR:'..v..text)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Set:On"..msg.sender.user_id..":"..msg_chat_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo", text)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف الرد من ردود المطور","md",true)  
end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
Redis:set(TheSNAYBIR.."SNAYBIR:PinMsegees:"..v,text)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSNAYBIR.."SNAYBIR:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(TheSNAYBIR..'SNAYBIR:Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
LuaTele.sendText(v,0,text,"md",true)
end
end
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تمت الاذاعه الى *- "..#list.." * مجموعه في البوت ","md",true)      
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:ChekBotAdd")   
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(TheSNAYBIR.."SNAYBIR:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:Num:User:Pv")   
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم التوجيه الى *- "..#list.." * مجموعه في البوت ","md",true) 
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(TheSNAYBIR.."SNAYBIR:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id) 
end 
return false
end
if text and Redis:get(TheSNAYBIR..'SNAYBIR:GetTexting:DevTheSNAYBIR'..msg_chat_id..':'..msg.sender.user_id) then
if text == 'الغاء' or text == 'الغاء الامر 𖤓' then 
Redis:del(TheSNAYBIR..'SNAYBIR:GetTexting:DevTheSNAYBIR'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم الغاء حفظ كليشة المطور')
end
Redis:set(TheSNAYBIR..'SNAYBIR:Texting:DevTheSNAYBIR',text)
Redis:del(TheSNAYBIR..'SNAYBIR:GetTexting:DevTheSNAYBIR'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم حفظ كليشة المطور')
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙ تم الغاء امر تعين الايدي عام","md",true)  
Redis:del(TheSNAYBIR.."SNAYBIR:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Redis:Id:Groups"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Id:Groups"..msg.chat_id,text:match("(.*)"))
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ تم تعين الايدي عام',"md",true)  
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) then 
if text == 'الغاء' then 
LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء امر تعين الايدي","md",true)  
Redis:del(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
return false  
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id) 
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Id:Group"..msg.chat_id,text:match("(.*)"))
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الايدي', data = msg.sender.user_id..'/chenid'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT ⁦', url='https://t.me/IIH5I'},
},
}
}
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم تعين الايدي الجديد',"md",true, false, false, false, reply_markup)
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Change:Name:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Change:Name:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء امر تغير اسم البوت","md",true)  
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Change:Name:Bot"..msg.sender.user_id) 
Redis:set(TheSNAYBIR.."SNAYBIR:Name:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙ تم تغير اسم البوت الى - "..text,"md",true)    
end 
if Redis:get(TheSNAYBIR.."SNAYBIR:Change:Start:Bot"..msg.sender.user_id) then 
if text == "الغاء" or text == 'الغاء الامر 𖤓' then   
Redis:del(TheSNAYBIR.."SNAYBIR:Change:Start:Bot"..msg.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙تم الغاء امر تغير كليشه start","md",true)  
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Change:Start:Bot"..msg.sender.user_id) 
Redis:set(TheSNAYBIR.."SNAYBIR:Start:Bot",text) 
return LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙ تم تغيير كليشه start - "..text,"md",true)    
end 
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Smile"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Smile"..msg.chat_id) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Smile"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - سمايل او سمايلات","md",true)  
end
end 
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Monotonous"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Monotonous"..msg.chat_id) then
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Monotonous"..msg.chat_id)
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - الاسرع او ترتيب","md",true)  

end
end 
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Riddles"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Riddles"..msg.chat_id) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Riddles"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - حزوره","md",true)  

end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Meaningof"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Meaningof"..msg.chat_id) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Meaningof"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - معاني","md",true)  

end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Reflection"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Reflection"..msg.chat_id) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Reflection"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - العكس","md",true)  

end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Estimate"..msg.chat_id..msg.sender.user_id) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 }\n","md",true)  
end 
local GETNUM = Redis:get(TheSNAYBIR.."SNAYBIR:Game:Estimate"..msg.chat_id..msg.sender.user_id)
if tonumber(NUM) == tonumber(GETNUM) then
Redis:del(TheSNAYBIR.."SNAYBIR:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Estimate"..msg.chat_id..msg.sender.user_id)
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id,5)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸︰تم اضافة { 5 } من النقاط \n","md",true)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:SADD:NUM"..msg.chat_id..msg.sender.user_id,1)
if tonumber(Redis:get(TheSNAYBIR.."SNAYBIR:SADD:NUM"..msg.chat_id..msg.sender.user_id)) >= 3 then
Redis:del(TheSNAYBIR.."SNAYBIR:SADD:NUM"..msg.chat_id..msg.sender.user_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Estimate"..msg.chat_id..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اوبس لقد خسرت في اللعبه \n𖤓︙حظآ اوفر في المره القادمه \n𖤓︙كان الرقم الذي تم تخمينه { "..GETNUM.." }","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اوبس تخمينك غلط \n𖤓︙ارسل رقم تخمنه مره اخرى ","md",true)  
end
end
end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Difference"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Difference"..msg.chat_id) then 
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Difference"..msg.chat_id)
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - المختلف","md",true)  
else
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Difference"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد خسرت حضا اوفر في المره القادمه\n𖤓︙اللعب مره اخره وارسل - المختلف","md",true)  
end
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Game:Example"..msg.chat_id) then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:Game:Example"..msg.chat_id) then 
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Example"..msg.chat_id)
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id, 1)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد فزت في اللعبه \n𖤓︙اللعب مره اخره وارسل - امثله","md",true)  
else
Redis:del(TheSNAYBIR.."SNAYBIR:Game:Example"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لقد خسرت حضا اوفر في المره القادمه\n𖤓︙اللعب مره اخره وارسل - امثله","md",true)  
end
end
if text then
local NewCmmd = Redis:get(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if Name_File ~= UserBot..'.json' then
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(TheSNAYBIR) ~= tonumber(FilesJson.BotId) then
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙جاري استرجاع المشتركين والكروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(TheSNAYBIR..'SNAYBIR:Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(TheSNAYBIR.."SNAYBIR:ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Originators:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Managers:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..GroupId,v)
end
end 
end
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم استرجاع {'..X..'} مجموعه \n𖤓︙واسترجاع {'..Y..'} مشترك في البوت')
end
end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(TheSNAYBIR) then 
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عذرا هاذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Originators:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Managers:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..idg,idASAS)
end;end
end
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم استرجاع المجموعات من نسخه تشاكي')
else
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙الملف لا يدعم هاذا البوت')
end
end
end
if (Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر 𖤓' then 
Redis:del(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم الغاء حفظ قناة الاشتراك')
end
Redis:del(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = LuaTele.getChatMember(UserId_Info.id,TheSNAYBIR).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(TheSNAYBIR..'SNAYBIR:Channel:Join',ChannelUser) 
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙هاذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR..'SNAYBIR:Channel:Join')
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري' or text == 'تغيير الاشتراك الاجباري 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR..'SNAYBIR:Channel:Redis'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == 'الاشتراك الاجباري 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Channel = Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')
if Channel then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end
if text == 'تحديث السورس' or text == 'تحديث السورس 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
os.execute('rm -rf SNAYBIR.lua')
download('http://95.179.129.103/SNAYBIR/SNAYBIR.lua')
LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙تم تحديث السورس * ',"md",true) 
dofile('SNAYBIR.lua')  
end
if text == '『 تعطيل الاذاعه 』' or text == 'تعطيل الاذاعه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:SendBcBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تعطيل الاذاعه ","md",true)
end
if text == '『 تفعيل الاذاعه 』' or text == 'تفعيل الاذاعه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:SendBcBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تفعيل الاذاعه للمطورين ","md",true)
end
if text == 'تعطيل المغادره 𖤓' or text == 'تعطيل المغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:LeftBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تعطيل المغادره ","md",true)
end
if text == 'تفعيل المغادره 𖤓' or text == 'تفعيل المغادره' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:LeftBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تفعيل المغادره للمطورين ","md",true)
end
if (Redis:get(TheSNAYBIR.."SNAYBIR:AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == '『 الغاء الامر 』' then   
Redis:del(TheSNAYBIR.."SNAYBIR:AddSudosNew"..msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, "\n𖤓︙ تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(TheSNAYBIR.."SNAYBIR:AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = LuaTele.searchPublicChat(text)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ تم تغيير المطور الاساسي اصبح على : [@"..text:gsub('@','').."]","md",true)  
end
end
if text == 'تغيير المطور الاساسي' or text == 'تغيير المطور الاساسي 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:AddSudosNew"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ ارسل معرف المطور الاساسي مع @","md",true)
end
if text == 'جلب النسخه الاحتياطيه 𖤓' or text == 'جلب نسخه احتياطيه' or text == 'جلب النسخه' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Groups = Redis:smembers(TheSNAYBIR..'SNAYBIR:ChekBotAdd')  
local UsersBot = Redis:smembers(TheSNAYBIR..'SNAYBIR:Num:User:Pv')  
local Get_Json = '{"BotId": '..TheSNAYBIR..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..v)
local Constructor = Redis:smembers(TheSNAYBIR.."SNAYBIR:Originators:Group"..v)
local Manager = Redis:smembers(TheSNAYBIR.."SNAYBIR:Managers:Group"..v)
local Admin = Redis:smembers(TheSNAYBIR.."SNAYBIR:Addictive:Group"..v)
local Vips = Redis:smembers(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"m98oh8"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json', '*𖤓︙تم جلب النسخه الاحتياطيه\n𖤓︙تحتوي على {'..#Groups..'} مجموعه \n𖤓︙وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
end
if text == 'جلب نسخه الردود' or text == 'جلب الردود' or text == 'جلب نسخه الردود 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Json = '{"BotId": '..TheSNAYBIR..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(TheSNAYBIR..'SNAYBIR:ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"taha":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود' and msg.reply_to_message_id ~= 0 or text == 'رفع الردود' and msg.reply_to_message_id ~= 0 then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.taha == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(TheSNAYBIR.."SNAYBIR:List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙تم استرجاع ردود المجموعات* ',"md",true)  
end
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙عدد احصائيات البوت الكامله \n— — — — — — — — —\n𖤓︙عدد المجموعات : '..(Redis:scard(TheSNAYBIR..'SNAYBIR:ChekBotAdd') or 0)..'\n𖤓︙عدد المشتركين : '..(Redis:scard(TheSNAYBIR..'SNAYBIR:Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تفعيل' and msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheSNAYBIR..'SNAYBIR:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عدد الاعضاء قليل لا يمكن تفعيل المجموعه  يجب ان يكوم اكثر من :'..Redis:get(TheSNAYBIR..'SNAYBIR:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تفعيلها مسبقا *',"md",true)  
else
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'رفع المالك والادمنيه 𖤓', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = '٬قفل الڪل 𖤓', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},
},
{
{text = 'تفعيل الايدي 𖤓', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'},
},
}
}
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'*\n𖤓︙تم تفعيل مجموعه جديده \n𖤓︙من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')*} \n𖤓︙معلومات المجموعه :\n𖤓︙عدد الاعضاء : '..Info_Chats.member_count..'\n𖤓︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n𖤓︙عدد المطرودين : '..Info_Chats.banned_count..'\n🔕︰عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:sadd(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id)
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Id"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تفعيل المجموعه *','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Developers then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرا انته لست ادمن او مالك المجموعه *","md",true)  
end
if not Redis:get(TheSNAYBIR.."SNAYBIR:BotFree") then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(TheSNAYBIR..'SNAYBIR:Num:Add:Bot') or 0)) and not msg.ControllerBot then
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عدد الاعضاء قليل لا يمكن تفعيل المجموعه  يجب ان يكوم اكثر من :'..Redis:get(TheSNAYBIR..'SNAYBIR:Num:Add:Bot'),"md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تفعيلها مسبقا *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة المجموعه ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'*\n𖤓︙تم تفعيل مجموعه جديده \n𖤓︙من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')*} \n𖤓︙معلومات المجموعه :\n𖤓︙عدد الاعضاء : '..Info_Chats.member_count..'\n𖤓︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n𖤓︙عدد المطرودين : '..Info_Chats.banned_count..'\n🔕︰عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'رفع المالك والادمنيه 𖤓', data = msg.sender.user_id..'/addAdmins@'..msg_chat_id},{text = 'قفل الڪل 𖤓', data =msg.sender.user_id..'/LockAllGroup@'..msg_chat_id},
},
{
{text = 'تفعيل الايدي 𖤓', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'},
},
}
}
Redis:sadd(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id)
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Id"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id,true) ;Redis:set(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تفعيل المجموعه اظغط رفع الادمنيه الرفع مالك الكروب ⚠️ *','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' and msg.Developers then
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تعطيلها مسبقا *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
LuaTele.sendText(Sudo_Id,0,'*\n𖤓︙تم تعطيل مجموعه جديده \n𖤓︙من قام بتعطيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')*} \n𖤓︙معلومات المجموعه :\n𖤓︙عدد الاعضاء : '..Info_Chats.member_count..'\n𖤓︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n𖤓︙عدد المطرودين : '..Info_Chats.banned_count..'\n🔕︰عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تعطيلها بنجاح *','md',true)
end
end
if text == 'تعطيل' and not msg.Developers then
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرا انته لست ادمن او مالك المجموعه *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تعطيلها مسبقا *',"md",true)  
else
if not msg.ControllerBot then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
break
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
aLuaTele.sendText(Sudo_Id,0,'*\n𖤓︙تم تعطيل مجموعه جديده \n𖤓︙من قام بتعطيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender.user_id..')*} \n𖤓︙معلومات المجموعه :\n𖤓︙عدد الاعضاء : '..Info_Chats.member_count..'\n𖤓︙عدد الادمنيه : '..Info_Chats.administrator_count..'\n𖤓︙عدد المطرودين : '..Info_Chats.banned_count..'\n𖤓︙عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙المجموعه : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n𖤓︙تم تعطيلها بنجاح *','md',true)
end
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(TheSNAYBIR.."SNAYBIR:ChekBotAdd",msg_chat_id) then
Redis:incr(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) 
if text == "ايدي" and msg.reply_to_message_id == 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:Id"..msg_chat_id) then
return false
end
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
local NumAdd = Redis:get(TheSNAYBIR.."SNAYBIR:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0
local Texting = {'ملاك وناسيك بكروبنه??',"حلغوم والله☹️ ","اطلق صوره🐼❤️","كيكك والله🥺","لازك بيها غيرها عاد😒",}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(TheSNAYBIR.."SNAYBIR:Set:Id:Group"..msg_chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return LuaTele.sendText(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
return LuaTele.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n*𖤓︙'..Description..
'\n𖤓︙ايديك : '..UserId..
'\n𖤓︙معرفك : '..UserInfousername..
'\n𖤓‍︰رتبتك : '..RinkBot..
'\n𖤓︙صورك : '..TotalPhoto..
'\n𖤓︙رسائلك : '..TotalMsg..
'\n𖤓︙تعديلاتك : '..TotalEdit..
'\n𖤓︙تفاعلك : '..TotalMsgT..
'*', "md")
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*𖤓︙ايديك : '..UserId..
'\n𖤓︙معرفك : '..UserInfousername..
'\n𖤓‍︰رتبتك : '..RinkBot..
'\n𖤓︙رسائلك : '..TotalMsg..
'\n𖤓︙تعديلاتك : '..TotalEdit..
'\n𖤓︙تفاعلك : '..TotalMsgT..
'*',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',msg.sender.user_id) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
return LuaTele.sendText(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*𖤓︙ايديك : '..UserId..
'\n𖤓︙معرفك : '..UserInfousername..
'\n𖤓‍︰رتبتك : '..RinkBot..
'\n𖤓︙رسائلك : '..TotalMsg..
'\n𖤓︙تعديلاتك : '..TotalEdit..
'\n𖤓︙تفاعلك : '..TotalMsgT..
'*',"md",true) 
end
end
end
if text == 'ايدي' or text == 'كشف'  and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local UserId = Message_Reply.sender.user_id
local RinkBot = Controller(msg_chat_id,Message_Reply.sender.user_id)
local TotalMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..Message_Reply.sender.user_id) or 0
local TotalEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..Message_Reply.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*𖤓︙ايديه : '..UserId..
'\n𖤓︙معرفه : '..UserInfousername..
'\n𖤓‍︰رتبته : '..RinkBot..
'\n𖤓︙رسائله : '..TotalMsg..
'\n𖤓︙تعديلاته : '..TotalEdit..
'\n𖤓︙تفاعله : '..TotalMsgT..
'*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*𖤓︙ايديه : '..UserId..
'\n𖤓︙معرفه : @'..UserName..
'\n𖤓‍︰رتبته : '..RinkBot..
'\n𖤓︙رسائله : '..TotalMsg..
'\n𖤓︙تعديلاته : '..TotalEdit..
'\n𖤓︙تفاعله : '..TotalMsgT..
'*',"md",true) 
end

if text == "مسح الرتب" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'مسح المميزين', data = msg.sender.user_id..'/'.. 'DelDistinguished'},{text = 'مسح الادمنيه', data = msg.sender.user_id..'/'.. 'Addictive'},
},
{
{text = 'مسح المدراء', data = msg.sender.user_id..'/'.. 'Managers'},{text = 'مسح المنشئين', data = msg.sender.user_id..'/'.. 'Originators'},
},
{
{text = ' مسح الاساسين ', data =msg.sender.user_id..'/'.. 'TheBasics'}
},
{
{text = '❲ إخفاء الأمر ❳', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, '𖤓︙يمكنك من هنا التحكم في رتب المجموعة ', 'md', false, false, false, false, reply_markup)
 end
 
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local List = { 
[[
 ◟𝗎ْ!𝖲 #username  .٠
◟𝖬ْ!𝖦 #msgs   .٠
◟𝖲ْ!𝖳 #stast 📍.  
◟𝖨ْ!𝖽 #id  📍 .٠
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛𝗂!𝖽 : #id ⛓️ '.
]],
[[
٫ USE #username .
٫ MSG  #msgs .
٫ STA #stast .
٫ iD  #id .
]],
[[
˛🎀: 𝖴ِᥱ᥉ : #username .
˛🎀: Iَժ : #id .
˛🎀: Sƚِᥲ : #stast .
˛🎀: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
 ∵ USERNAME . #username
 ∵ STAST . #stast
 ∵ ID . #id
 ∵ MSGS . #msgs
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]],
[[
َ› Msgs : #msgs .🦇
َ› ID : #id .🦇
َ› Stast : #stast .🦇
َ› UserName : #username .🦇
]],
[[
☁️ . USERNAME . #username
☁️ . STAST . #stast
☁️ . ID . #id
☁️ . MSGS . #msgs
]],
[[
 . USERNAME . #username
 . STAST . #stast
 . ID . #id
 . MSGS . #msgs
]],
[[
  USERNAME . #username
  STAST . #stast
  ID . #id
  MSGS . #msgs
]],
[[
◜⛓️ِ𝗨َِS𝗘ِr #username 🕷 .  
◜⛓️ِ𝗠ِsِG  #msgs   .
◜⛓️ِ𝗦َ𝗧 #stast  .
◜⛓️ِ𝗜ِd  #id 🕸 .
]],
[[
 . USERNAME . #username
 . STAST . #stast
 . ID . #id
 . MSGS . #msgs
]],
[[
˛ 𝗎!𝗌 : #username ٰ⛓️ '.
˛ 𝗆!𝗀 #msgs .
˛ 𝗌!𝗍 : #stast .
˛𝗂!𝖽 : #id ⛓️ '.
]],
[[
َ› Msgs : #msgs .🦇
َ› ID : #id .🦇
َ› Stast : #stast .🦇
َ› UserName : #username .🦇
]],
[[
: 𝖴ِᥱ᥉ : #username .
: Iَժ : #id .
: Sƚِᥲ : #stast .
: 𝖬⁪⁬⁮᥉َ𝗀 : #msgs .
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Id:Group"..msg.chat_id,Text_Rand)
return LuaTele.sendText(msg_chat_id,msg_id, '𖤓︙تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'رتبتي' then
local ban = LuaTele.getUser(msg.sender.user_id)
local news = ' '..msg.Name_Controller
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text =news,url = "https://t.me/IIH5I"}, },}}
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖤓︙رتبتك هي : '..msg.Name_Controller,"md", false, false, false, false, reply_markup)
end
if text == 'ايديي' then
return LuaTele.sendText(msg_chat_id,msg_id,'\nايديك -› '..msg.sender.user_id,"md",true)  
end
if text == "اسمي"  then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.first_name then
news = " "..ban.first_name.." "
else
news = " لا يوجد"
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖤓︙اسمك الأول : '..ban.first_name,"md",true)
end
if text == "معرفي" or text == "يوزري" then
local ban = LuaTele.getUser(msg.sender.user_id)
if ban.username then
banusername = '[@'..ban.username..']'
else
banusername = 'لا يوجد'
end
return LuaTele.sendText(msg_chat_id,msg_id,'\n𖤓︙معرفك هذا : @'..ban.username,"md",true)
end
if text == 'معلوماتي' or text == 'موقعي' then
local UserInfo = LuaTele.getUser(msg.sender.user_id)
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك المجموعه'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف المجموعه'
else
StatusMemberChat = 'عظو في المجموعه'
end
local UserId = msg.sender.user_id
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg_chat_id..':'..msg.sender.user_id) or 0
local TotalEdit = Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg_chat_id..msg.sender.user_id) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف المجموعه' then 
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
PermissionsUser = '*\n𖤓︙صلاحيات المستخدم :\n— — — — — — — — —'..'\n𖤓︙تغيير المعلومات : '..change_info..'\n𖤓︙تثبيت الرسائل : '..pin_messages..'\n𖤓︙اضافه مستخدمين : '..invite_users..'\n𖤓︙مسح الرسائل : '..delete_messages..'\n𖤓︙حظر المستخدمين : '..restrict_members..'\n𖤓︙اضافه المشرفين : '..promote..'\n\n*'
end
return LuaTele.sendText(msg_chat_id,msg_id,
'\n*𖤓︙ايديك : '..UserId..
'\n𖤓︙معرفك : '..UserInfousername..
'\n𖤓‍︰رتبتك : '..RinkBot..
'\n𖤓‍︰رتبته المجموعه: '..StatusMemberChat..
'\n𖤓︙رسائلك : '..TotalMsg..
'\n𖤓︙تعديلاتك : '..TotalEdit..
'\n𖤓︙تفاعلك : '..TotalMsgT..
'*'..(PermissionsUser or '') ,"md",true) 
end
if text == 'كشف البوت' then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,TheSNAYBIR).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙البوت عضو في المجموعه ',"md",true) 
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,TheSNAYBIR).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
PermissionsUser = '*\n𖤓︙صلاحيات البوت في المجموعه :\n— — — — — — — — —'..'\n𖤓︙تغيير المعلومات : '..change_info..'\n𖤓︙تثبيت الرسائل : '..pin_messages..'\n𖤓︙اضافه مستخدمين : '..invite_users..'\n𖤓︙مسح الرسائل : '..delete_messages..'\n𖤓︙حظر المستخدمين : '..restrict_members..'\n𖤓︙اضافه المشرفين : '..promote..'\n\n*'
return LuaTele.sendText(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end

if text and text:match('^تنظيف (%d+)$') then
local NumMessage = text:match('^تنظيف (%d+)$')
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙العدد اكثر من 1000 لا تستطيع الحذف',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
var(deleteMessages)
Message = Message - 1048576
end
LuaTele.sendText(msg_chat_id, msg_id, "𖤓︙تم تنظيف - "..NumMessage.. ' رساله', 'md')
end

if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖤓︙تم تنزيله مطور ثانوي مسبقا *").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"*𖤓︙تم تنزيله مطور ثانوي *").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖤓︙تم تنزيله مطور ثانوي مسبقا *").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"*𖤓︙تم تنزيله مطور ثانوي *").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = LuaTele.searchPublicChat(UserName[2])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مطور ").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مدير  ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = LuaTele.getUser(UserId[2])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.TheBasicsm then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(44)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(4)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(5)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(6)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(7)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId[2]) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id,UserId[2]) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[2],"𖤓︙تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغير رد المطور (.*)$") then
local Teext = text:match("^تغير رد المطور (.*)$") 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:Developer:Bot:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد المطور الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ الاساسي (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد المنشئ الاساسي (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:President:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد المنشئ الاساسي الى :"..Teext)
elseif text and text:match("^تغير رد المنشئ (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد المنشئ (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:Constructor:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد المنشئ الى :"..Teext)
elseif text and text:match("^تغير رد المدير (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد المدير (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:Manager:Group:Reply"..msg.chat_id,Teext) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد المدير الى :"..Teext)
elseif text and text:match("^تغير رد الادمن (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد الادمن (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:Admin:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد الادمن الى :"..Teext)
elseif text and text:match("^تغير رد المميز (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد المميز (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:Vip:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد المميز الى :"..Teext)
elseif text and text:match("^تغير رد العضو (.*)$") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local Teext = text:match("^تغير رد العضو (.*)$") 
Redis:set(TheSNAYBIR.."SNAYBIR:Mempar:Group:Reply"..msg.chat_id,Teext)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تغير رد العضو الى :"..Teext)
elseif text == 'حذف رد المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Developer:Bot:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حدف رد المطور")
elseif text == 'حذف رد المنشئ الاساسي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:President:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد المنشئ الاساسي ")
elseif text == 'حذف رد المنشئ' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Constructor:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد المنشئ ")
elseif text == 'حذف رد المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Manager:Group:Reply"..msg.chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد المدير ")
elseif text == 'حذف رد الادمن' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Admin:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد الادمن ")
elseif text == 'حذف رد المميز' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Vip:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد المميز")
elseif text == 'حذف رد العضو' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Mempar:Group:Reply"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف رد العضو")
end
if text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه مطورين الثانويين \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين الثانويين', data = msg.sender.user_id..'/DevelopersQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه مطورين البوت \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المالكين' then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙لا يوجد مالكين في البوت *","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المالكين في البوت ⇧⇩*\n⩹┉┉┉┉⊶❲𖥳𝗠𝗔𝗟𝗔𝗠𝗢 𖥳❳⊷┉┉┉┉⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = 'مسح المالكين ', data = msg.sender.user_id..'/TheBasicsQ'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المنشئين الاساسيين \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المنشئين الاساسيين', data = msg.sender.user_id..'/TheBasics'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد منشئين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المنشئين  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المنشئين', data = msg.sender.user_id..'/Originators'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مدراء حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المدراء  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المدراء', data = msg.sender.user_id..'/Managers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد ادمنيه حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه الادمنيه  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح الادمنيه', data = msg.sender.user_id..'/Addictive'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مميزين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المميزين  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المميزين', data = msg.sender.user_id..'/DelDistinguished'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المحظورين عام  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾??𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المحظورين  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين', data = msg.sender.user_id..'/BanGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مكتومين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المكتومين  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين', data = msg.sender.user_id..'/SilentGroupGroup'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Link"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Welcome"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Id"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الايدي بالصوره ","md",true)
end
if TextMsg == 'ردود المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل ردود المدير ","md",true)
end
if TextMsg == 'ردود المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل ردود المطور ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Games"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:KickMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل اطردني ","md",true)
end
if TextMsg == 'صورتي' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:photo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تفعيل صورتي ","md",true)
end
if TextMsg == 'كول' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:kool"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تفعيل امر كول ","md",true)
end
if TextMsg == 'جمالي' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:gamle"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تفعيل جمالي ","md",true)
end
if TextMsg == 'ردود السورس' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙ تم تفعيل ردود السورس *","md",true)
end
if TextMsg == 'نزلني' then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:remMe"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙ تم تفعيل نزلني *","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل التواصل داخل البوت ","md",true)
end

end

if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheSNAYBIR.."SNAYBIR1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheSNAYBIR.."SNAYBIR1:List:Rd:Sudo"..msg.chat_id, text)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير الرد', data = msg.sender.user_id..'/chengreplygg'},
},
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/delamrredis'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url='https://t.me/IIH5I'},
},
}
}
return  LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ',"md",true, false, false, false, reply_markup) 
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR1:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
Redis:del(TheSNAYBIR..'SNAYBIR1:Add:Rd:Sudo:Text'..text..msg.chat_id)
Redis:del(TheSNAYBIR..'SNAYBIR1:Add:Rd:Sudo:Text1'..text..msg.chat_id)
Redis:del(TheSNAYBIR..'SNAYBIR1:Add:Rd:Sudo:Text2'..text..msg.chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR1:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheSNAYBIR.."SNAYBIR1:List:Rd:Sudo"..msg.chat_id, text)
return  LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده")
end
end
if text == ("مسح الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR1:List:Rd:Sudo"..msg.chat_id)
for k,v in pairs(list) do  
Redis:del(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text"..v..msg.chat_id) 
Redis:del(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text1"..v..msg.chat_id) 
Redis:del(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text2"..v..msg.chat_id) 
Redis:del(TheSNAYBIR.."SNAYBIR1:List:Rd:Sudo"..msg.chat_id)
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف ردود المتعدده")
end
if text == ("الردود المتعدده") then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR1:List:Rd:Sudo"..msg.chat_id)
text = "\nقائمة ردود المتعدده \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => {"..v.."} => {"..db.."}\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
 LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]")
end
if text == "اضف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد" then    
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text1"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR1:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text2"..test..msg.chat_id, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text"..text..msg.chat_id)   
local Text1 = Redis:get(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text1"..text..msg.chat_id)   
local Text2 = Redis:get(TheSNAYBIR.."SNAYBIR1:Add:Rd:Sudo:Text2"..text..msg.chat_id)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id, '\nارسل لي الكلمه الان ')
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id, "true1")
Redis:set(TheSNAYBIR.."SNAYBIR11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id, text)
Redis:sadd(TheSNAYBIR.."SNAYBIR11:List:Rd:Sudo", text)
return false end
end
if text and text:match("^(.*)$") then
if Redis:get(TheSNAYBIR.."SNAYBIR11:Set:On"..msg.sender.user_id..":"..msg.chat_id) == "true" then
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف الرد من ردود المتعدده")
Redis:del(TheSNAYBIR..'SNAYBIR11:Add:Rd:Sudo:Text'..text)
Redis:del(TheSNAYBIR..'SNAYBIR11:Add:Rd:Sudo:Text1'..text)
Redis:del(TheSNAYBIR..'SNAYBIR11:Add:Rd:Sudo:Text2'..text)
Redis:del(TheSNAYBIR.."SNAYBIR11:Set:On"..msg.sender.user_id..":"..msg.chat_id)
Redis:srem(TheSNAYBIR.."SNAYBIR11:List:Rd:Sudo", text)
return false
end
end
if text == ("مسح الردود المتعدده عام") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR11:List:Rd:Sudo")
for k,v in pairs(list) do  
Redis:del(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text"..v) 
Redis:del(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text1"..v) 
Redis:del(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text2"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR11:List:Rd:Sudo")
end
 LuaTele.sendText(msg_chat_id,msg_id,"تم حذف ردود المتعدده")
end
if text == ("الردود المتعدده عام") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR11:List:Rd:Sudo")
text = "\nقائمة ردود المتعدده \n━━━━━━━━\n"
for k,v in pairs(list) do
db = "رساله "
text = text..""..k.." => {"..v.."} => {"..db.."}\n"
end
if #list == 0 then
text = "لا توجد ردود متعدده"
end
 LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]")
end
if text == "اضف رد متعدد عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الرد الذي اريد اضافته")
end
if text == "حذف رد متعدد عام" then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:On"..msg.sender.user_id..":"..msg.chat_id,true)
return  LuaTele.sendText(msg_chat_id,msg_id,"ارسل الان الكلمه لحذفها ")
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "true1" then
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd1')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الاول ارسل الرد الثاني")
return false  
end  
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd1" then
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd2')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text1"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد الثاني ارسل الرد الثالث")
return false  
end  
end
if text then  
local test = Redis:get(TheSNAYBIR.."SNAYBIR11:Text:Sudo:Bot"..msg.sender.user_id..":"..msg.chat_id)
if Redis:get(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id) == "rd2" then
Redis:set(TheSNAYBIR.."SNAYBIR11:Set:Rd"..msg.sender.user_id..":"..msg.chat_id,'rd3')
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text2"..test, text)  
end  
 LuaTele.sendText(msg_chat_id,msg_id,"تم حفظ الرد")
return false  
end  
end
if text then
local Text = Redis:get(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text"..text)   
local Text1 = Redis:get(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text1"..text)   
local Text2 = Redis:get(TheSNAYBIR.."SNAYBIR11:Add:Rd:Sudo:Text2"..text)   
if Text or Text1 or Text2 then 
local texting = {
Text,
Text1,
Text2
}
Textes = math.random(#texting)
 LuaTele.sendText(msg_chat_id,msg_id,texting[Textes])
end
end
 
if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id, msg.id)
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Del:Media"..msg.chat_id) then    
local gmedia = Redis:scard(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)  
if gmedia >= 200 then
local liste = Redis:smembers(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "𖤓︙تم مسح "..k.." من الوسائط تلقائيا\n𖤓︙يمكنك تعطيل الميزه بستخدام الامر ( `تعطيل المسح التلقائي` )"
LuaTele.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
LuaTele.sendText(msg_chat_id,msg_id, t)
Redis:del(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)
end
end
end

if text == ("امسح") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "𖤓︙تم مسح "..k.." من الوسائط الموجوده"
LuaTele.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)
end
end
if #list == 0 then
t = "𖤓︙لا يوجد ميديا في المجموعه"
end
 LuaTele.sendText(msg_chat_id,msg_id, t)
end
if text == ("عدد الميديا") then  
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
local gmria = Redis:scard(TheSNAYBIR.."SNAYBIR:allM"..msg.chat_id)  
 LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙عدد الميديا الموجود هو (* "..gmria.." *)","md")
end
if text == "تعطيل امسح" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Del:Media"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم تعطيل المسح التلقائي للميديا')
return false
end 
if text == "تفعيل امسح" then        
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Del:Media"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم تفعيل المسح التلقائي للميديا')
return false
end 
if text == "تعطيل اليوتيوب" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:yt"..msg.chat_id)
 LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم تعطيل المسح اليوتيوب')
return false
end 
if text == "تفعيل اليوتيوب" then        
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:yt"..msg.chat_id,true)
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم تفعيل اليوتيوب')
return false
end 
if text and text:match('^بحث (.*)$') and Redis:get(TheSNAYBIR.."SNAYBIR:Status:yt"..msg.chat_id) then
local Ttext = text:match('^بحث (.*)$') 
local MsgId = msg.id/2097152/0.5
local MSGID = string.gsub(MsgId,'.0','')
local httpsCurl = "https://devstorm.ml/YoutubeApi/tahaj200.php?token="..Token.."&msg="..MSGID.."&Text="..URL.escape(Ttext).."&chat_id="..msg_chat_id.."&user="..msg.sender.user_id
io.popen('curl -s "'..httpsCurl..'"')
end


if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الرابط ","md",true)
end
if TextMsg == 'الترحيب' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Welcome"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الترحيب ","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Id"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الايدي ","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الايدي بالصوره ","md",true)
end
if TextMsg == 'ردود المدير' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل ردود المدير ","md",true)
end
if TextMsg == 'ردود المطور' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل ردود المطور ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Games"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الالعاب ","md",true)
end
if TextMsg == 'اطردني' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:KickMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل اطردني ","md",true)
end
if TextMsg == 'صورتي' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:photo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تعطيل صورتي ","md",true)
end
if TextMsg == 'كول' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:kool"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تعطيل امر كول ","md",true)
end
if TextMsg == 'جمالي' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:gamle"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ تم تعطيل جمالي ","md",true)
end
if TextMsg == 'ردود السورس' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙ تم تعطيل ردود السورس *","md",true)
end
if TextMsg == 'نزلني' then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:remMe"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙ تم تعطيل نزلني *","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل التواصل داخل البوت ","md",true)
end

end

if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼??𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/IIH5I'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n𖤓︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الاساسي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,UserId_Info.id).." 』*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'المطور الثانوي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,UserId_Info.id).." 』*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,UserId_Info.id).." 』*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,UserId_Info.id).." 』*","md",true)  
end
if Controller(msg_chat_id,UserId_Info.id) == 'مطور السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,UserId_Info.id).." 』*","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙ تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙ تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم العام @(%S+)$') then
local UserName = text:match('^الغاء كتم العام @(%S+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/IIH5I'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n𖤓︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙ تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙ تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end 
end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusSilent(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName[3])
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تقييده في المجموعه \n𖤓︙لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌??𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تقييده في المجموعه \n𖤓︙لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$') }
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId[3])
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId[3]).." } *","md",true)  
end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n𖤓︙تم تقييده في المجموعه \n𖤓︙لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  
end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تقييده في المجموعه ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾??𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId_Info.id},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,Message_Reply.sender.user_id) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء العام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanAll:Groups",Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/IIH5I'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n𖤓︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if ban and ban.type and ban.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الاساسي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,Message_Reply.sender.user_id).." 』*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'المطور الثانوي' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,Message_Reply.sender.user_id).." 』*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,Message_Reply.sender.user_id).." 』*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مبرمج السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,Message_Reply.sender.user_id).." 』*","md",true)  
end
if Controller(msg_chat_id,Message_Reply.sender.user_id) == 'مطور السورس' then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ عذرا لا تستطيع كتم عام『 "..Controller(msg_chat_id,Message_Reply.sender.user_id).." 』*","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙ تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙ تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء كتم العام') and msg.reply_to_message_id ~= 0 then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(2)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/IIH5I'}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n𖤓︙ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = LuaTele.getUser(Message_Reply.sender.user_id)
if ban.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if ban and ban.type and ban.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ عذرا لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙ تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:ktmAll:Groups",Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙ تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء حظر') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text == ('كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusSilent(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text == ('الغاء كتم') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼??𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text == ('الغاء التقييد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text == ('طرد') and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,Message_Reply.sender.user_id).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..Message_Reply.sender.user_id},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم طرده من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end

if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻?? † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر (%d+)$') then
local UserId = text:match('^حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم حظره من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم حظره من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء حظره من المجموعه مسبقا ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء حظره من المجموعه  ").Reply,"md",true)  
end
end

if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusSilent(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم كتمه في المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم كتمه في المجموعه  ").Reply,"md",true, false, false, false, reply_markup)
end
end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼??𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
else
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId) 
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء كتمه من المجموعه ").Reply,"md",true)  
end
end

if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم تقييده في المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end

if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم الغاء تقييده من المجموعه").Reply,"md",true)  
end

if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if not msg.Originators and not Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل (الحظر : الطرد : التقييد) من قبل المدراء","md",true)
end 
local UserInfo = LuaTele.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر', data = msg.sender.user_id..'/unbanktmkid@'..UserId},
},
}
}
if Redis:sismember(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) then
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم طرده من المجموعه مسبقا ").Reply,"md",true, false, false, false, reply_markup)
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId) 
LuaTele.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId,"𖤓︙تم طرده من المجموعه ").Reply,"md",true, false, false, false, reply_markup)
end
end

if text == "اطردني" or text == "طردني" then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:KickMe"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙امر اطردني تم تعطيله من قبل المدراء *","md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,msg.sender.user_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,msg.sender.user_id).." } *","md",true)  
end
local StatusMember = LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙عذرا لا استطيع طرد ادمنيه ومنشئين المجموعه*","md",true)    
end
LuaTele.setChatMemberStatus(msg.chat_id,msg.sender.user_id,'banned',0)
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم طردك من المجموعه بنائآ على طلبك").Reply,"md",true)  
end

if text == 'ادمنيه الكروب' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
listAdmin = '\n*𖤓︙قائمه الادمنيه \n — — — — — — — — —*\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Creator = '→ *{ المالك }*'
else
Creator = ""
end
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin.."*"..k.." - @"..UserInfo.username.."* "..Creator.."\n"
else
listAdmin = listAdmin.."*"..k.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listAdmin,"md",true)  
end
if text == 'رفع الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙تم ترقيه - ('..y..') ادمنيه *',"md",true)  
end

if text == 'المالك' or text == 'المنشئ' then
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙︰عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(itsEssen..'Essen:Channel:Join:Name')..'', url = 't.me/'..Redis:get(itsEssen..'Essen:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙︰اوبس , المالك حسابه محذوف *","md",true)  
return false
end 
local photo = LuaTele.getUserProfilePhotos(UserInfo.id)
local InfoUser = LuaTele.getUserFullInfo(UserInfo.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if photo.total_count > 0 then
local TestText = "  ❲ Owner Groups ❳\n— — — — — — — — —\n𖤓︙*Owner Name* :  ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n𖤓︙*Owner Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else

local TestText = "- معلومات المالك : \n\n- ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n \n ["..Bio.."]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
end
end


if text == 'كشف البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*𖤓︙قائمه البوتات \n — — — — — — — — —*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if Info_Members.members[k].status.luatele == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '→ *{ ادمن }*'
else
Admin = ""
end
listBots = listBots.."*"..k.." - @"..UserInfo.username.."* "..Admin.."\n"
end
LuaTele.sendText(msg_chat_id,msg_id,listBots.."*\n— — — — — — — — —\n𖤓︙عدد البوتات التي هي ادمن ( "..x.." )*","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = nil
restricted = '\n*𖤓︙قائمه المقيديين \n — — — — — — — — —*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." - @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
LuaTele.sendText(msg_chat_id,msg_id,restricted,"md",true)  
end
end


if text == "غادر" or text == "بوت غادر" or text == "مغادره" then 
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if not msg.ControllerBot and not Redis:set(TheSNAYBIR.."SNAYBIR:LeftBot") then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ امر المغادره معطل من قبل الاساسي *',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تأكيد الامر', data = '/Zxchq'..msg_chat_id}, {text = 'الغاء الامر', data = msg.sender.user_id..'/Redis'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙ يرجاء تأكيد الأمر عزيزي*',"md",false, false, false, false, reply_markup)
end
if text == 'تاك للكل' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼????𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*𖤓︙قائمه الاعضاء \n — — — — — — — — —*\n'
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end

if text == "قفل الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:text"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Join"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..msg_chat_id,true)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheSNAYBIR.."SNAYBIR:lockpin"..msg_chat_id,(LuaTele.getChatPinnedMessage(msg_chat_id).id or true)) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:edit"..msg_chat_id,true) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end  
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(TheSNAYBIR..'SNAYBIR:'..lock..msg_chat_id,"del")    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل جميع الاوامر").Lock,"md",true)  
return false
end 


--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:text"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Join"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end  
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:lockpin"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:edit"..msg_chat_id) 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end 
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(TheSNAYBIR..'SNAYBIR:'..lock..msg_chat_id)    
end
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فـتح جميع الاوامر").unLock,"md",true)  
return false
end 
if text == "@all" or text == "تاك عام" or text == "all" or text == "a" or text == "تعو" or text == "A" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
x = 0
tags = 0
local list = Info_Members.members
for k, v in pairs(list) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then
tags = x + 5
listall = ""
end
x = x + 1
if UserInfo.first_name ~= '' then
listall = listall.." ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id.."),"
end
if x == 5 or x == tags or k == 0 then
LuaTele.sendText(msg_chat_id,msg_id,listall,"md",true)  
end
end
end
if text == "غنيلي" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/TEAMSUL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "متحركه" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار متحركه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "شعر" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الشعر لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ميمز" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الميمز لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/remixsource/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ريمكس" or text == "ريماكس" then 
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار ريمكس لك*'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/remixsource/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "فلم" or text == "ريماكس" then 
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الفلم لك*'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "انمي" or text == "انميي" then 
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار انمي لك*'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "اغنيه" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/lDIDIl/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "صوره" or text == "صورة" then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار صور*'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosDavid/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == 'تعطيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*✫︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Status:joinet"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"▽︙تم تعطيل التحقق ","md",true)
end
if text == 'تفعيل التحقق' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*✫︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:Status:joinet"..msg_chat_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"▽︙تم تفعيل التحقق ","md",true)
end
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..msg_chat_id ,"Spam:User")  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Link"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌??𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼??𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Cmd"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂??𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Photo"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Video"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n ??𝖾𝗅??𝗈???? 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Animation"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:geam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅??𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Audio"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:vico"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n ??𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:forward"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n ??𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Document"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ ??𝗅𝗂𝖼𝗄 ??𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Contact"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Spam"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id,"del")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقيد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id,"ked")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id,"ktm")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id,"kick")  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Inlen"..msg_chat_id)  
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(msg.sender.user_id,"𖤓︙تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Set:Link"..msg_chat_id..""..msg.sender.user_id,120,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"📥︰ارسل رابط المجموعه او رابط قناة المجموعه","md",true)  
end
if text == "مسح الرابط" or text == "حذف الرابط" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Group:Link"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:Link"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل جلب الرابط من قبل الادمنيه","md",true)
end 
local Get_Chat = LuaTele.getChat(msg_chat_id)
local GetLink = Redis:get(TheSNAYBIR.."SNAYBIR:Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return LuaTele.sendText(msg_chat_id, msg_id, "ꪎ : 𝗅𝗂𝗇𝗄 𝗀𝗋𝗈𝗎𝗉 †. \n["..Get_Chat.title.. ']('..GetLink..')', 'md', true, false, false, false, reply_markup)
else
local LinkGroup = LuaTele.generateChatInviteLink(msg_chat_id,'taha',tonumber(msg.date+86400),100,false)
if LinkGroup.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return LuaTele.sendText(msg_chat_id, msg_id, "ꪎ : 𝗅𝗂𝗇𝗄 𝗀𝗋𝗈𝗎𝗉 †. \n["..Get_Chat.title.. ']('..LinkGroup.invite_link..')', 'md', true, false, false, false, reply_markup)
end
end

if text == "ضع ترحيب" or text == "وضع ترحيب" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender.user_id, 120, true)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي الترحيب الان".."\n𖤓︙تستطيع اضافة مايلي !\n𖤓︙دالة عرض الاسم »{`name`}\n𖤓︙دالة عرض المعرف »{`user`}\n𖤓︙دالة عرض اسم المجموعه »{`NameCh`}","md",true)   
end
if text == "الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:Welcome"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(TheSNAYBIR.."SNAYBIR:Welcome:Group"..msg_chat_id)
if Welcome then 
return LuaTele.sendText(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لم يتم تعيين ترحيب للمجموعه","md",true)   
end 
end
if text == "مسح الترحيب" or text == "حذف الترحيب" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Welcome:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم ازالة ترحيب المجموعه","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Set:Rules:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "حذف القوانين" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Group:Rules"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم ازالة قوانين المجموعه","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(TheSNAYBIR.."SNAYBIR:Group:Rules" .. msg_chat_id)   
if Rules then     
return LuaTele.sendText(msg_chat_id,msg_id,Rules,"md",true)     
else      
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Set:Description:" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي وصف المجموعه الان","md",true)  
end
if text == "مسح الوصف" or text == "حذف الوصف" then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
LuaTele.setChatDescription(msg_chat_id, '') 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم ازالة قوانين المجموعه","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
LuaTele.setChatTitle(msg_chat_id,NameChat)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تغيير اسم المجموعه الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") then  
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:set(TheSNAYBIR.."SNAYBIR:Chat:Photo"..msg_chat_id..":"..msg.sender.user_id,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الصوره لوضعها","md",true)    
end

if text == "مسح قائمه المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(TheSNAYBIR.."SNAYBIR:Filter:Group:"..v..msg_chat_id)  
Redis:srem(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id,v)  
end  
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح ("..#list..") كلمات ممنوعه *","md",true)   
end
if text == "قائمه المنع" then   
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Filter"..msg_chat_id)  
if #list == 0 then  
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*𖤓︙قائمه المنع \n — — — — — — — — —*\n'
for k,v in pairs(list) do  
print(v)
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(TheSNAYBIR.."SNAYBIR:Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."- "..ver.." » { "..Text_Filter.." }*\n"    
end  
LuaTele.sendText(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ ??𝗅𝗂𝖼𝗄 ??𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id,'true')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:FilterText'..msg_chat_id..':'..msg.sender.user_id,'DelFilter')
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end

if text == "اضف امر" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Command:Reids:Group"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙الان ارسل لي الامر القديم ...","md",true)
end
if text == "حذف امر" or text == "مسح امر" then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender.user_id,"true") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Command:List:Group"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:Command:List:Group"..msg_chat_id.."")
Command = "𖤓︙قائمه الاوامر المضافه  \n— — — — — — — — —\n"
for k,v in pairs(list) do
Commands = Redis:get(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ˓ {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "𖤓︙لا توجد اوامر اضافيه"
end
return LuaTele.sendText(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم تثبيت الرساله","md",true)
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = LuaTele.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم الغاء تثبيت الرساله","md",true)
LuaTele.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = LuaTele.unpinChatMessage(msg_chat_id) 
if not LuaTele.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂??𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼??𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = msg.sender.user_id..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = msg.sender.user_id..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = msg.sender.user_id..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = msg.sender.user_id..'/'.. 'mute_welcome'},
},
{
{text = 'تعطيل الايدي', data = msg.sender.user_id..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = msg.sender.user_id..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = msg.sender.user_id..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل ردود المدير', data = msg.sender.user_id..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = msg.sender.user_id..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل ردود المطور', data = msg.sender.user_id..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = msg.sender.user_id..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = msg.sender.user_id..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = msg.sender.user_id..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = msg.sender.user_id..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = msg.sender.user_id..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = msg.sender.user_id..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = msg.sender.user_id..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = msg.sender.user_id..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = msg.sender.user_id..'/'.. 'mute_kickme'},
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, '𖤓︙اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Link"..msg.chat_id) then
Statuslink = '❬ ✔️ ❭' else Statuslink = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Welcome"..msg.chat_id) then
StatusWelcome = '❬ ✔️ ❭' else StatusWelcome = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Id"..msg.chat_id) then
StatusId = '❬ ✔️ ❭' else StatusId = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '❬ ✔️ ❭' else StatusIdPhoto = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Reply"..msg.chat_id) then
StatusReply = '❬ ✔️ ❭' else StatusReply = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '❬ ✔️ ❭' else StatusReplySudo = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:BanId"..msg.chat_id)  then
StatusBanId = '❬ ✔️ ❭' else StatusBanId = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:SetId"..msg.chat_id) then
StatusSetId = '❬ ✔️ ❭' else StatusSetId = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
StatusGames = '❬ ✔️ ❭' else StatusGames = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:KickMe"..msg.chat_id) then
Statuskickme = '❬ ✔️ ❭' else Statuskickme = '❬ ❌ ❭'
end
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:AddMe"..msg.chat_id) then
StatusAddme = '❬ ✔️ ❭' else StatusAddme = '❬ ❌ ❭'
end
local protectionGroup = '\n*𖤓︙اعدادات حمايه المجموعه\n — — — — — — — — —\n'
..'\n𖤓︙جلب الرابط ➤ '..Statuslink
..'\n𖤓︙جلب الترحيب ➤ '..StatusWelcome
..'\n𖤓︙الايدي ➤ '..StatusId
..'\n𖤓︙الايدي بالصوره ➤ '..StatusIdPhoto
..'\n𖤓︙ردود المدير ➤ '..StatusReply
..'\n𖤓︙ردود المطور ➤ '..StatusReplySudo
..'\n𖤓︙الرفع ➤ '..StatusSetId
..'\n𖤓︙الحظر - الطرد ➤ '..StatusBanId
..'\n𖤓︙الالعاب ➤ '..StatusGames
..'\n𖤓︙امر اطردني ➤ '..Statuskickme..'*\n\n.'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n𖤓︙اعدادات المجموعه ".."\n🔏︰علامة ال (✔️) تعني مقفول".."\n🔓︰علامة ال (❌) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =msg.sender.user_id..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =msg.sender.user_id..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =msg.sender.user_id..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =msg.sender.user_id..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =msg.sender.user_id..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =msg.sender.user_id..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =msg.sender.user_id..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =msg.sender.user_id..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =msg.sender.user_id..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =msg.sender.user_id..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =msg.sender.user_id..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =msg.sender.user_id..'/'.. 'Status_bots'},
},
{
{text = 'التالي 🔁. ', data =msg.sender.user_id..'/'.. 'NextSeting'}
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'المجموعه' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍?? 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻?? † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = LuaTele.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local permissions = '*\n𖤓︙صلاحيات المجموعه :\n— — — — — — — — —'..'\n𖤓︙ارسال الويب : '..web..'\n𖤓︙تغيير معلومات المجموعه : '..info..'\n𖤓︙اضافه مستخدمين : '..invite..'\n𖤓︙تثبيت الرسائل : '..pin..'\n𖤓︙ارسال الميديا : '..media..'\n𖤓︙ارسال الرسائل : '..messges..'\n𖤓︙اضافه البوتات : '..other..'\n𖤓︙ارسال استفتاء : '..polls..'*\n\n'
local TextChat = '*\n𖤓︙معلومات المجموعه :\n— — — — — — — — —'..' \n𖤓︙عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n𖤓︙عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n𖤓︙عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n𖤓︙عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n𖤓︙اسم المجموعه : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭*'
return LuaTele.sendText(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
if text == 'صلاحيات المجموعه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = LuaTele.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = msg.sender.user_id..'/web'}, 
},
{
{text = '- تغيير معلومات المجموعه : '..info, data =msg.sender.user_id..  '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data =msg.sender.user_id..  '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data =msg.sender.user_id..  '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data =msg.sender.user_id..  '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data =msg.sender.user_id..  '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data =msg.sender.user_id..  '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data =msg.sender.user_id.. '/polls'}, 
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. '/delAmr'}
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "𖤓︙ الصلاحيات - ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id) then
dev = "المطور ،" else dev = "" end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
crr = "منشئ اساسي ،" else crr = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Originators:Group'..msg_chat_id, Message_Reply.sender.user_id) then
cr = "منشئ ،" else cr = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Managers:Group'..msg_chat_id, Message_Reply.sender.user_id) then
own = "مدير ،" else own = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Addictive:Group'..msg_chat_id, Message_Reply.sender.user_id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Distinguished:Group'..msg_chat_id, Message_Reply.sender.user_id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(Message_Reply.sender.user_id) == true then
Rink = 1
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id)  then
Rink = 2
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 3
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 4
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 5
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 6
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender.user_id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ليس لديه اي رتبه هنا *","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Developers:Groups",Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, Message_Reply.sender.user_id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, Message_Reply.sender.user_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙تم تنزيل الشخص من الرتب التاليه { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id) then
dev = "المطور ،" else dev = "" end
if Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" else crr = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Originators:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" else cr = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Managers:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" else own = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Addictive:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" else mod = "" end
if Redis:sismember(TheSNAYBIR..'SNAYBIR:Distinguished:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" else vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, UserId_Info.id) then
Rink = 3
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
else
Rink = 8
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙ليس لديه اي رتبه هنا *","md",true)  
end
if msg.ControllerBot then
if Rink == 1 or Rink < 1 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Developers:Groups",UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Developers then
if Rink == 2 or Rink < 2 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.TheBasics then
if Rink == 3 or Rink < 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Originators then
if Rink == 4 or Rink < 4 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Managers then
if Rink == 5 or Rink < 5 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Addictive then
if Rink == 6 or Rink < 6 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id, UserId_Info.id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙تم تنزيل الشخص من الرتب التاليه { "..dev..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = msg.sender.user_id..'/groupNumseteng//'..Message_Reply.sender.user_id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "𖤓︙ صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = msg.sender.user_id..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return LuaTele.sendText(msg_chat_id, msg_id, "𖤓︙ صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"𖤓︙تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
Redis:del(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' then
Redis:del(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
Redis:del(TheSNAYBIR..'SNAYBIR:Num:Add:Memp'..msg.chat_id..':'..msg.sender.user_id)
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عدد رسائلك هنا *~ '..(Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:User'..msg.chat_id..':'..msg.sender.user_id) or 1)..'*',"md",true)  
elseif text == 'سحكاتي' or text == 'تعديلاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عدد التعديلات هنا *~ '..(Redis:get(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..msg.chat_id..msg.sender.user_id) or 0)..'*',"md",true)  
elseif text == 'جهاتي' then
LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عدد جهاتك المضافه هنا *~ '..(Redis:get(TheSNAYBIR.."SNAYBIR:Num:Add:Memp"..msg.chat_id..":"..msg.sender.user_id) or 0)..'*',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Addictive then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حذف الرسائل* ',"md",true)  
end
LuaTele.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
LuaTele.deleteMessages(msg.chat_id,{[1]= msg_id})
end
if text == 'تعين الايدي عام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Set:Id:Groups"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
𖤓︙ ارسل الان النص
𖤓︙ يمكنك اضافه :
𖤓︙ `#username` » اسم المستخدم
𖤓︙ `#msgs` » عدد الرسائل
𖤓︙ `#photos` » عدد الصور
𖤓︙ `#id` » ايدي المستخدم
𖤓︙ `#auto` » نسبة التفاعل
𖤓︙ `#stast` » رتبة المستخدم 
𖤓︙ `#edit` » عدد السحكات
𖤓︙ `#game` » عدد المجوهرات
𖤓︙ `#AddMem` » عدد الجهات
𖤓︙ `#Description` » تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي عام' or text == 'مسح الايدي عام' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙ هاذا الامر يخص 『 '..Controller_Num(1)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Id:Groups")
return LuaTele.sendText(msg_chat_id,msg_id, '𖤓︙ تم ازالة كليشة الايدي العامه',"md",true)  
end

if text == 'تعين الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..msg.chat_id..""..msg.sender.user_id,240,true)  
return LuaTele.sendText(msg_chat_id,msg_id,[[
𖤓︙ارسل الان النص
𖤓︙يمكنك اضافه :
𖤓︙`#username` » اسم المستخدم
𖤓︙`#msgs` » عدد الرسائل
𖤓︙`#photos` » عدد الصور
𖤓︙`#id` » ايدي المستخدم
𖤓︙`#auto` » نسبة التفاعل
𖤓︙`#stast` » رتبة المستخدم 
𖤓︙`#edit` » عدد السحكات
𖤓︙`#game` » عدد المجوهرات
𖤓︙`#AddMem` » عدد الجهات
𖤓︙`#Description` » تعليق الصوره
]],"md",true)    
end 
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Id:Group"..msg.chat_id)
return LuaTele.sendText(msg_chat_id,msg_id, '𖤓︙تم ازالة كليشة الايدي ',"md",true)  
end

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين ثانوين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
if not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص 『 '..Controller_Num(3)..' 』* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = ''..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join:Name')..'', url = 't.me/'..Redis:get(TheSNAYBIR'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'\n• يجب عليك الاشتراك في القناه',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مالكين في البوت ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if LuaTele.getChatMember(msg_chat_id,msg.sender.user_id).status.luatele ~= "chatMemberStatusCreator" or not msg.Developers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.TheBasics then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Originators:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Originators then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐??𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Managers:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Addictive:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.DevelopersQ then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المحظورين *","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id) 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المكتومين *","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..x.."} من المقيديين *","md",true)
end
if TextMsg == 'البوتات' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عدد البوتات الموجوده : "..#List_Members.."\n𖤓︙تم طرد ( "..x.." ) بوت من المجموعه *","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عدد المطرودين في الموجوده : "..#List_Members.."\n𖤓︙تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
end
if TextMsg == 'المحذوفين' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼??𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local UserInfo = LuaTele.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
end
end
end
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙تم طرد ( "..x.." ) حساب محذوف *","md",true)  
end
end


if text == ("مسح ردود المدير") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(TheSNAYBIR.."SNAYBIR:List:Manager"..msg_chat_id)
end
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم مسح قائمه ردود المدير","md",true)  
end
if text == ("ردود المدير") then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Manager"..msg_chat_id.."")
text = "𖤓︙قائمه ردود المدير \n— — — — — — — — —\n"
for k,v in pairs(list) do
if Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو 📹"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف 𖤓"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "𖤓︙عذرا لا يوجد ردود للمدير في المجموعه"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لاضافتها في ردود المدير ","md",true)  
end
if text == "حذف رد" then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..msg.sender.user_id..":"..msg_chat_id,"true2")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لحذفها من ردود المدير","md",true)  
end
if text == ("مسح ردود المطور") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف ردود المطور","md",true)  
end
if text == ("ردود المطور") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
text = "\n📝︰قائمة ردود المطور \n— — — — — — — — —\n"
for k,v in pairs(list) do
if Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..v) then
db = "ملف 𖤓"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "𖤓︙لا توجد ردود للمطور"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد للكل" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  
end
if text == "حذف رد للكل" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لحذفها من ردود المطور","md",true)  
end
if text=="اذاعه خاص" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي التوجيه الان\n𖤓︙ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي التوجيه الان\n𖤓︙ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙معلومات الكشف \n— — — — — — — — —"..'\n𖤓︙الحظر العام : '..BanAll..'\n𖤓︙الحظر : '..BanGroup..'\n𖤓︙الكتم : '..SilentGroup..'\n𖤓︙التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙معلومات الكشف \n— — — — — — — — —"..'\n𖤓︙الحظر العام : '..BanAll..'\n𖤓︙الحظر : '..BanGroup..'\n𖤓︙الكتم : '..SilentGroup..'\n𖤓︙التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,Message_Reply.sender.user_id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,Message_Reply.sender.user_id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:BanAll:Groups",Message_Reply.sender.user_id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,Message_Reply.sender.user_id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,Message_Reply.sender.user_id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف قناة او كروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = LuaTele.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
LuaTele.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.ControllerBot then
BanAll = 'محظور عام ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..msg_chat_id,UserId_Info.id) 
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'وضع كليشه المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻?? † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈??𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:GetTexting:DevTheSNAYBIR'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR..'SNAYBIR:Texting:DevTheSNAYBIR')
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ تم حذف كليشه المطور')
end
if text == 'مبرمج سورس' or text == 'مبرمج السورس' or text == 'المبرمج' then  
local UserId_Info = LuaTele.searchPublicChat("m98oh8")
if UserId_Info.id then
local UserInfo = LuaTele.getUser(UserId_Info.id)
local InfoUser = LuaTele.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "  𖤓 SNAYBIR 𝖲𝗈𝗎𝗋𝖼e \n— — — — — — — — —\n •︙*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n•︙*Dev Bio* : [𖤓 "..Bio.." ]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'َ𓆩.𖤓 َِ𝗢ْ𝗺ْ𝗮َِ𝗥 ْ𝗮َِ𝗟 ُ𝗮َِ𝗛ْ𝗺َِ𝗘َِ𝗗 𖤓.𓆪َ', url = "https://t.me/m98oh8"},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "𖤓 معلومات مبرمج السورس : \\nn: name Dev . ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'َ𓆩.𖤓 َِ𝗢ْ𝗺ْ𝗮َِ𝗥 ْ𝗮َِ𝗟 ُ𝗮َِ𝗛ْ𝗺َِ𝗘َِ𝗗 𖤓.𓆪َ', url = "https://t.me/m98oh8"},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
if text == 'المطور' or text == 'مطور' then   
local UserInfo = LuaTele.getUser(Sudo_Id) 
local InfoUser = LuaTele.getUserFullInfo(Sudo_Id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = LuaTele.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "  ❲ Developers Bot ❳\n— — — — — — — — —\n𖤓︙*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n𖤓︙*Dev Bio* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = "https://t.me/IIH5I"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "  ❲ Developers Source ❳\n— — — — — — — — —\n𖤓︙*Dev Name* :  ["..UserInfo.first_name.."](tg://user?id="..Sudo_Id..")\n𖤓︙*Dev Bio* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if text == 'جمالي' or text == 'نسبه جمالي' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:gamle"..msg_chat_id) then
return false
end
local ban = LuaTele.getUser(msg.sender.user_id)
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =' نسبة جمالك ياحلو'..rdbhoto..' 🙏😔🦋',url = "https://t.me/"..ban.username..""}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(rdbhoto).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if text and text:match("^كول (.*)$")then
local m = text:match("^كول (.*)$")
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:kool"..msg.chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,m,"md",true) 
end
end
if text == "صورتي" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:photo"..msg.chat_id) then
local photo = LuaTele.getUserProfilePhotos(msg.sender.user_id)
local ban = LuaTele.getUser(msg.sender.user_id)
local ban_ns = 'ᯏ'
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data = msg.sender.user_id..'/ban88'}, 
},
{
{text = ' صورتك القادمه', callback_data= msg.sender.user_id..'/ban1'}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
end
if text == 'رابط الحذف' or text == 'رابط حذف' then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheDrox..'Drox:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'Telegram', url = 'https://my.telegram.org/auth?to=delete'},{text = 'Instagram', url = 'https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/'}
},
{
{text = 'Facebook', url = 'https://www.facebook.com/help/deleteaccount'},{text = 'Snapchat', url = 'https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount'}
},
{
{text = '˛ 𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT .', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙رابط الحذف في جميع مواقع التواصل*',"md",false, false, false, false, reply_markup)
end
if text == "تويت بالصور" then
local t = "ليك تويت في الصوره ↫"
Rrr = math.random(4,50)
local m = "https://t.me/wffhvv/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' or text == 'source' then
photo = "https://t.me/llll4ll/7"
local T =[[
╔━━━━━𓄼•★•𓄹━━━━╗ 
┇ ⦑SNAYBIR SOURCE⦒ ┇
╚━━━━━𓄼•★•𓄹━━━━╝ 
]]
keyboard = {} 
keyboard.inline_keyboard = {

{
{text = '★ Developer', url = "https://t.me/m98oh8"}
},
{
{text = '★ ZKRAFA SNAYBIR ', url = "https://t.me/J2U2BOT"}
},
{
{text = ' ★ Source Channel', url = "https://t.me/iih5i"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))

elseif text == 'الاوامر' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = msg.sender.user_id..'/help1'}, {text = ' •أوامر الادمنية•', data = msg.sender.user_id..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = msg.sender.user_id..'/help3'}, {text = '•أوامر المنشئين•', data = msg.sender.user_id..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = msg.sender.user_id..'/help5'}, {text = '•الالعاب والتسليه•', data = msg.sender.user_id..'/help6'}, 
},
{
{text = '•القفل والفتح•', data = msg.sender.user_id..'/NoNextSeting'}, {text = '•التفعيل والتعطيل•', data = msg.sender.user_id..'/listallAddorrem'}, 
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
𖤓︙توجد ← 5 اوامر في البوت
— — — — — — — — —
𖤓︙ارسل { م1 } ← اوامر الحمايه
𖤓︙ارسل { م2 } ← اوامر الادمنيه
𖤓︙ارسل { م3 } ← اوامر المدراء
𖤓︙ارسل { م4 } ← اوامر المنشئين
𖤓︙ارسل { م5 } ← اوامر مطورين البوت
*]],"md",false, false, false, false, reply_markup)
elseif text == 'م2' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'قائمة ألاوامر 𖤓', data = msg.sender.user_id..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م3' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'قائمة ألاوامر 𖤓', data = msg.sender.user_id..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م4' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'قائمة ألاوامر 𖤓', data = msg.sender.user_id..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'م5' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'قائمة ألاوامر 𖤓', data = msg.sender.user_id..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
elseif text == 'الالعاب' then
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'قائمة ألاوامر 𖤓', data = msg.sender.user_id..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙عليك استخدام اوامر التحكم بالقوائم',"md",false, false, false, false, reply_markup)
end
if text == '،' or text == '،،،' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* *","md",true)  
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'*تفضل يلعزيز💘 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'تمام' or text == 'تمامو' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*تـدوم عمࢪيي💘 ️*',"md",false, false, false, false, reply_markup)
end
if text == '😐' or text == '🙂' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* شـبي حـلـو صـافـن😻💋 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'هلوو' or text == 'هلو' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* هلوات يروحي🤤😻 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'هلاا' or text == 'هلا' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* لك هلا كلب 😹💔 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'شلونكم' or text == 'شلونك' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* بخير وانت ععمري 😻🤤 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'اشلونج' or text == 'شلونج' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'* بخير بس لتلح 😒🙂 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'اريد اكبل' or text == 'ارتبط' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*امـشي وخࢪ مـنـا يدوࢪ تـڪـبيل😏 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'هايي' or text == 'هاي' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*نزوج 🥺😂 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'هاا' or text == 'ها' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*وجعا تع شوف شيريدون منك  ️*',"md",false, false, false, false, reply_markup)
end
if text == 'لتزحف' or text == 'زاحف' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شـعليڪ بـي عمࢪيي خـلي يـزحف💘☹️ ️*',"md",false, false, false, false, reply_markup)
end
if text == 'كلخره' or text == 'كل خره' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*اسـف عمࢪيي مـا خليڪ بـحـلڪي😹?? ️*',"md",false, false, false, false, reply_markup)
end
if text == 'زحف' or text == 'زاحفه' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*زاحـف ع خـالـڪ شـڪࢪه🤤💋 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'دي' or text == 'دد' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*امـشـيڪ بـيها عمࢪيي😗😹 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'فرخ' or text == 'كحبه' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ويـنـه بـلـه خـل حـصـࢪه😹🤤 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'تعالي خاص' or text == 'خاص' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*هااا يـول اخـذتـها خـاص😹🙊 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'اكرهك' or text == 'اكرهج' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عـساس انـي مـيـت بيڪڪ دمـشـي لڪ😿😹 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'احبك' or text == 'احبج' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*يـحـياتـي وانـي هـم حـبـڪڪ🙈💋️*',"md",false, false, false, false, reply_markup)
end
if text == 'فديت' or text == 'فدوه' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*فدااك روحيي وهذا الاثول الڪتله فديت 💔😹*',"md",false, false, false, false, reply_markup)
end
if text == 'باي' or text == 'سيو' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*ويـن دايـح عمࢪيي خـلـينـا مـونـسـيـن🥺💘️*',"md",false, false, false, false, reply_markup)
end
if text == 'عوائل' or text == 'صايره عوائل' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*حـبيـبي ولله ࢪبـط فـيـشه ويـانـا🙈💋 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'واكف' or text == 'وكف' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*شـغال عمࢪيي🤓💘 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'وين المدير' or text == 'المدير' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*عمࢪيي تـفـضل وياڪ مـديـࢪ💘️*',"md",false, false, false, false, reply_markup)
end
if text == 'انجب' or text == 'انجبي' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*صـاࢪ عمࢪيي💘🥺 ️*',"md",false, false, false, false, reply_markup)
end
if text == 'تحبني' or text == 'تحبيني' then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..msg_chat_id) then
return LuaTele.sendText(msg_chat_id,msg_id,"* 𖤓 ردود السورس معطلة*","md",true)  
end
return LuaTele.sendText(msg_chat_id,msg_id,'*سـؤال صـعـب خلـيـني افڪࢪ☹️️*',"md",false, false, false, false, reply_markup)
end
if text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙تم تحديث الملفات","md",true)
dofile('SNAYBIR.lua')  
end
if text == "تغير اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉??𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ ارسل لي الاسم الان ","md",true)  
end
if text == "حذف اسم البوت" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف اسم البوت ","md",true)   
end
if text == (Redis:get(TheSNAYBIR.."SNAYBIR:Name:Bot") or "روليت") then
local NamesBot = (Redis:get(TheSNAYBIR.."SNAYBIR:Name:Bot") or "روليت")
local NameBots = {
"ها "..NamesBot.. " شتريد؟",
"أჂ̤ أჂ̤ هياتني اني",
"موجود بس لتصيح",
"لتــلح دا احجي ويه بنات روليت بعدين اجاوبك",
"راح نموت بكورونا ونته بعدك تصيح "..NamesBot,
'يمعود والله نعسان'
}
return LuaTele.sendText(msg_chat_id,msg_id, NameBots[math.random(#NameBots)],"md",true)  
end
if text == "بوت" then
local NamesBot = (Redis:get(TheSNAYBIR.."SNAYBIR:Name:Bot") or "روليت")
local BotName = {
"دحك لك ترا اسمي "..NamesBot,
"ها يعمري اسمي "..NamesBot.. "",
"عندي اسم تره والله 🥺💔؟"
}
return LuaTele.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md",true)   
end
if text == 'تنظيف المشتركين' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheSNAYBIR..'SNAYBIR:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' }\n𖤓︙تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' }\n𖤓︙لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheSNAYBIR)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*𖤓︙البوت عظو في المجموعه سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheSNAYBIR..'SNAYBIR:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheSNAYBIR..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(TheSNAYBIR..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(TheSNAYBIR..'SNAYBIR:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' } للمجموعات \n𖤓︙تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n𖤓︙تم تعطيل المجموعه ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' } للمجموعات \n𖤓︙لا توجد مجموعات وهميه*',"md")
end
end
if text == "سمايلات" or text == "سمايل" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
Random = {"🍏","🍎","🍐","🍊","🍋","🍉","🍇","🍓","🍈","🍒","🍑","🍍","🥥","🥝","🍅","🍆","🥑","🥦","🥒","🌶","🌽","🥕","🥔","🥖","🥐","🍞","🥨","🍟","🧀","🥚","🍳","🥓","🥩","🍗","🍖","🌭","🍔","🍠","🍕","🥪","🥙","☕️","🥤","🍶","🍺","🍻","🏀","⚽️","🏈","⚾️","🎾","🏐","🏉","🎱","🏓","🏸","🥅","🎰","🎮","🎳","🎯","🎲","🎻","🎸","🎺","🥁","🎹","🎼","🎧","🎤","🎬","🎨","🎭","🎪","🎟","🎫","🎗","🏵","🎖","🏆","🥌","🛷","🚗","🚌","🏎","🚓","🚑","🚚","🚛","🚜","⚔","🛡","🔮","🌡","💣","𖤓","📍","📓","📗","📂","📅","📪","📫","𖤓","📭","⏰","📺","🎚","☎️","📡"}
SM = Random[math.random(#Random)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Smile"..msg.chat_id,SM)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يدز هاذا السمايل ? ~ {`"..SM.."`}","md",true)  
end
end
if text == "كت" or text == "كت تويت" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
local texting = {"اخر افلام شاهدتها", 
"اخر افلام شاهدتها", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليش حسين ذكي؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" آخر مره ضربت عشره كانت متى ؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وكوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تكولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
    "هل انت دي تويت باعت باندا؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمكولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمكولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تكولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
"تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت باندا؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب باندا؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تكول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل باندا لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تكولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي باندا ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تكوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "خيرني" or text == "لو خيروك" or text == "خيروك" then 
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
local texting = {"لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ ",
"لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معكول؟ ",
"لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ ",
"لو خيروك |  بين تناول البيتزا وبين الايس كريم وذلك بشكل دائم؟ ",
"لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ ",
"لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ ",
"لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ ",
"لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ ",
"لو كنت شخص اخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ ",
"لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ ",
"لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ ",
"لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ ",
"لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ ",
"لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ ",
"لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ ",
"لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ ",
"لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ ",
"لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ ",
"لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تكوله وبين القدرة على حفظ كل ما تراه أمامك؟ ",
"لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ ",
"لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ ",
"لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ ",
"لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ ",
"لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ ",
"لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ ",
"لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ ",
"لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ ",
"لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ ",
"لو خيروك |  بين كول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ ",
"لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ ",
"لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ ",
"لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ ",
"لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ ",
"لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ ",
"لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ ",
"لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ ",
"لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ ",
"لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ ",
"لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ ",
"لو خيروك |  بين أمك وأبيك؟ ",
"لو خيروك |  بين أختك وأخيك؟ ",
"لو خيروك |  بين نفسك وأمك؟ ",
"لو خيروك |  بين صديق قام بغدرك وعدوك؟ ",
"لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ ",
"لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ ",
"لو خيروك |  بين ابنك وابنتك؟ ",
"لو خيروك |  بين زوجتك وابنك/ابنتك؟ ",
"لو خيروك |  بين جدك أو جدتك؟ ",
"لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ ",
"لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ ",
"لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ ",
"لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ ",
"لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ ",
"لو خيروك |  بين أخيك البعيد أو جارك القريب؟ ",
"لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ ",
"لو خيروك |  بين رجل أعمال أو أمير؟ ",
"لو خيروك |  بين نجار أو حداد؟ ",
"لو خيروك |  بين طباخ أو خياط؟ ",
"لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ ",
"لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ ",
"لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ ",
"لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ ",
"لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ ",
"لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ ",
"لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ ",
"لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ ",
"لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ ",
"لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ ",
"لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ ",
"لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ ",
"لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ ",
"لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ ",
"لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ ",
"لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ ",
"لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ ",
"لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ ",
"لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ ",
"لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ ",
"لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ ",
"لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ ",
"لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ ",
"لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك اب أرتيست؟ ",
"لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ ",
"لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ ",
"لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ ",
"لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ ",
"لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ ",
"لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ ",
"لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ ",
"لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ ",
"لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ ",
"لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ ",
"لو خيروك |  بين امتلاك قطة أو كلب؟ ",
"لو خيروك |  بين الصداقة والحب ",
"لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ ",
"لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "حروف" or text == "حرف" or text == "الحروف" then 
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
local texting = {" جماد بحرف ↫ ر  ", 
" مدينة بحرف ↫ ع  ",
" حيوان ونبات بحرف ↫ خ  ", 
" اسم بحرف ↫ ح  ", 
" اسم ونبات بحرف ↫ م  ", 
" دولة عربية بحرف ↫ ق  ", 
" جماد بحرف ↫ ي  ", 
" نبات بحرف ↫ ج  ", 
" اسم بنت بحرف ↫ ع  ", 
" اسم ولد بحرف ↫ ع  ", 
" اسم بنت وولد بحرف ↫ ث  ", 
" جماد بحرف ↫ ج  ",
" حيوان بحرف ↫ ص  ",
" دولة بحرف ↫ س  ",
" نبات بحرف ↫ ج  ",
" مدينة بحرف ↫ ب  ",
" نبات بحرف ↫ ر  ",
" اسم بحرف ↫ ك  ",
" حيوان بحرف ↫ ظ  ",
" جماد بحرف ↫ ذ  ",
" مدينة بحرف ↫ و  ",
" اسم بحرف ↫ م  ",
" اسم بنت بحرف ↫ خ  ",
" اسم و نبات بحرف ↫ ر  ",
" نبات بحرف ↫ و  ",
" حيوان بحرف ↫ س  ",
" مدينة بحرف ↫ ك  ",
" اسم بنت بحرف ↫ ص  ",
" اسم ولد بحرف ↫ ق  ",
" نبات بحرف ↫ ز  ",
"  جماد بحرف ↫ ز  ",
"  مدينة بحرف ↫ ط  ",
"  جماد بحرف ↫ ن  ",
"  مدينة بحرف ↫ ف  ",
"  حيوان بحرف ↫ ض  ",
"  اسم بحرف ↫ ك  ",
"  نبات و حيوان و مدينة بحرف ↫ س  ", 
"  اسم بنت بحرف ↫ ج  ", 
"  مدينة بحرف ↫ ت  ", 
"  جماد بحرف ↫ ه  ", 
"  اسم بنت بحرف ↫ ر  ", 
" اسم ولد بحرف ↫ خ  ", 
" جماد بحرف ↫ ع  ",
" حيوان بحرف ↫ ح  ",
" نبات بحرف ↫ ف  ",
" اسم بنت بحرف ↫ غ  ",
" اسم ولد بحرف ↫ و  ",
" نبات بحرف ↫ ل  ",
"مدينة بحرف ↫ ع  ",
"دولة واسم بحرف ↫ ب  ",
} 
return LuaTele.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
end
if text == "الاسرع" or tect == "ترتيب" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
KlamSpeed = {"سحور","سياره","استقبال","قنفه","ايفون","بزونه","مطبخ","كرستيانو","دجاجه","مدرسه","الوان","غرفه","ثلاجه","كهوه","سفينه","العراق","محطه","طياره","رادار","منزل","مستشفى","كهرباء","تفاحه","اخطبوط","سلمون","فرنسا","برتقاله","تفاح","مطرقه","بتيته","لهانه","شباك","باص","سمكه","ذباب","تلفاز","حاسوب","انترنيت","ساحه","جسر"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Monotonous"..msg.chat_id,name)
name = string.gsub(name,"سحور","س ر و ح")
name = string.gsub(name,"سياره","ه ر س ي ا")
name = string.gsub(name,"استقبال","ل ب ا ت ق س ا")
name = string.gsub(name,"قنفه","ه ق ن ف")
name = string.gsub(name,"ايفون","و ن ف ا")
name = string.gsub(name,"بزونه","ز و ه ن")
name = string.gsub(name,"مطبخ","خ ب ط م")
name = string.gsub(name,"كرستيانو","س ت ا ن و ك ر ي")
name = string.gsub(name,"دجاجه","ج ج ا د ه")
name = string.gsub(name,"مدرسه","ه م د ر س")
name = string.gsub(name,"الوان","ن ا و ا ل")
name = string.gsub(name,"غرفه","غ ه ر ف")
name = string.gsub(name,"ثلاجه","ج ه ت ل ا")
name = string.gsub(name,"كهوه","ه ك ه و")
name = string.gsub(name,"سفينه","ه ن ف ي س")
name = string.gsub(name,"العراق","ق ع ا ل ر ا")
name = string.gsub(name,"محطه","ه ط م ح")
name = string.gsub(name,"طياره","ر ا ط ي ه")
name = string.gsub(name,"رادار","ر ا ر ا د")
name = string.gsub(name,"منزل","ن ز م ل")
name = string.gsub(name,"مستشفى","ى ش س ف ت م")
name = string.gsub(name,"كهرباء","ر ب ك ه ا ء")
name = string.gsub(name,"تفاحه","ح ه ا ت ف")
name = string.gsub(name,"اخطبوط","ط ب و ا خ ط")
name = string.gsub(name,"سلمون","ن م و ل س")
name = string.gsub(name,"فرنسا","ن ف ر س ا")
name = string.gsub(name,"برتقاله","ر ت ق ب ا ه ل")
name = string.gsub(name,"تفاح","ح ف ا ت")
name = string.gsub(name,"مطرقه","ه ط م ر ق")
name = string.gsub(name,"بتيته","ب ت ت ي ه")
name = string.gsub(name,"لهانه","ه ن ل ه ل")
name = string.gsub(name,"شباك","ب ش ا ك")
name = string.gsub(name,"باص","ص ا ب")
name = string.gsub(name,"سمكه","ك س م ه")
name = string.gsub(name,"ذباب","ب ا ب ذ")
name = string.gsub(name,"تلفاز","ت ف ل ز ا")
name = string.gsub(name,"حاسوب","س ا ح و ب")
name = string.gsub(name,"انترنيت","ا ت ن ر ن ي ت")
name = string.gsub(name,"ساحه","ح ا ه س")
name = string.gsub(name,"جسر","ر ج س")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يرتبها ~ {"..name.."}","md",true)  
end
end
if text == "حزوره" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
Hzora = {"الجرس","عقرب الساعه","السمك","المطر","5","الكتاب","البسمار","7","الكعبه","بيت الشعر","لهانه","انا","امي","الابره","الساعه","22","غلط","كم الساعه","البيتنجان","البيض","المرايه","الضوء","الهواء","الضل","العمر","القلم","المشط","الحفره","البحر","الثلج","الاسفنج","الصوت","بلم"};
name = Hzora[math.random(#Hzora)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Riddles"..msg.chat_id,name)
name = string.gsub(name,"الجرس","شيئ اذا لمسته صرخ ما هوه ؟")
name = string.gsub(name,"عقرب الساعه","اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟")
name = string.gsub(name,"السمك","ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟")
name = string.gsub(name,"المطر","شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟")
name = string.gsub(name,"5","ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ")
name = string.gsub(name,"الكتاب","ما الشيئ الذي له اوراق وليس له جذور ؟")
name = string.gsub(name,"البسمار","ما هو الشيئ الذي لا يمشي الا بالضرب ؟")
name = string.gsub(name,"7","عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ")
name = string.gsub(name,"الكعبه","ما هو الشيئ الموجود وسط مكة ؟")
name = string.gsub(name,"بيت الشعر","ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ")
name = string.gsub(name,"لهانه","وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ")
name = string.gsub(name,"انا","ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟")
name = string.gsub(name,"امي","اخت خالك وليست خالتك من تكون ؟ ")
name = string.gsub(name,"الابره","ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ")
name = string.gsub(name,"الساعه","ما هو الشيئ الذي يكول الصدق ولكنه اذا جاع كذب ؟")
name = string.gsub(name,"22","كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ")
name = string.gsub(name,"غلط","ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ")
name = string.gsub(name,"كم الساعه","ما هو السؤال الذي تختلف اجابته دائما ؟")
name = string.gsub(name,"البيتنجان","جسم اسود وقلب ابيض وراس اخظر فما هو ؟")
name = string.gsub(name,"البيض","ماهو الشيئ الذي اسمه على لونه ؟")
name = string.gsub(name,"المرايه","ارى كل شيئ من دون عيون من اكون ؟ ")
name = string.gsub(name,"الضوء","ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟")
name = string.gsub(name,"الهواء","ما هو الشيئ الذي يسير امامك ولا تراه ؟")
name = string.gsub(name,"الضل","ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ")
name = string.gsub(name,"العمر","ما هو الشيء الذي كلما طال قصر ؟ ")
name = string.gsub(name,"القلم","ما هو الشيئ الذي يكتب ولا يقرأ ؟")
name = string.gsub(name,"المشط","له أسنان ولا يعض ما هو ؟ ")
name = string.gsub(name,"الحفره","ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟")
name = string.gsub(name,"البحر","ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟")
name = string.gsub(name,"الثلج","انا ابن الماء فان تركوني في الماء مت فمن انا ؟")
name = string.gsub(name,"الاسفنج","كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟")
name = string.gsub(name,"الصوت","اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟")
name = string.gsub(name,"بلم","حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يحل الحزوره ↓\n {"..name.."}","md",true)  
end
end
if text == "معاني" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Maany"..msg.chat_id)
Maany_Rand = {"قرد","دجاجه","بطريق","ضفدع","بومه","نحله","ديك","جمل","بقره","دولفين","تمساح","قرش","نمر","اخطبوط","سمكه","خفاش","اسد","فأر","ذئب","فراشه","عقرب","زرافه","قنفذ","تفاحه","باذنجان"}
name = Maany_Rand[math.random(#Maany_Rand)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Meaningof"..msg.chat_id,name)
name = string.gsub(name,"قرد","🐒")
name = string.gsub(name,"دجاجه","🐔")
name = string.gsub(name,"بطريق","🐧")
name = string.gsub(name,"ضفدع","🐸")
name = string.gsub(name,"بومه","🦉")
name = string.gsub(name,"نحله","🐝")
name = string.gsub(name,"ديك","🐓")
name = string.gsub(name,"جمل","🐫")
name = string.gsub(name,"بقره","🐄")
name = string.gsub(name,"دولفين","🐬")
name = string.gsub(name,"تمساح","🐊")
name = string.gsub(name,"قرش","🦈")
name = string.gsub(name,"نمر","🐅")
name = string.gsub(name,"اخطبوط","🐙")
name = string.gsub(name,"سمكه","🐟")
name = string.gsub(name,"خفاش","🦇")
name = string.gsub(name,"اسد","🦁")
name = string.gsub(name,"فأر","🐭")
name = string.gsub(name,"ذئب","🐺")
name = string.gsub(name,"فراشه","🦋")
name = string.gsub(name,"عقرب","🦂")
name = string.gsub(name,"زرافه","🦒")
name = string.gsub(name,"قنفذ","🦔")
name = string.gsub(name,"تفاحه","🍎")
name = string.gsub(name,"باذنجان","🍆")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يدز معنى السمايل ~ {"..name.."}","md",true)  
end
end
if text == "العكس" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Aks"..msg.chat_id)
katu = {"باي","فهمت","موزين","اسمعك","احبك","موحلو","نضيف","حاره","ناصي","جوه","سريع","ونسه","طويل","سمين","ضعيف","شريف","شجاع","رحت","عدل","نشيط","شبعان","موعطشان","خوش ولد","اني","هادئ"}
name = katu[math.random(#katu)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Reflection"..msg.chat_id,name)
name = string.gsub(name,"باي","هلو")
name = string.gsub(name,"فهمت","مافهمت")
name = string.gsub(name,"موزين","زين")
name = string.gsub(name,"اسمعك","ماسمعك")
name = string.gsub(name,"احبك","ماحبك")
name = string.gsub(name,"موحلو","حلو")
name = string.gsub(name,"نضيف","وصخ")
name = string.gsub(name,"حاره","بارده")
name = string.gsub(name,"ناصي","عالي")
name = string.gsub(name,"جوه","فوك")
name = string.gsub(name,"سريع","بطيء")
name = string.gsub(name,"ونسه","ضوجه")
name = string.gsub(name,"طويل","قزم")
name = string.gsub(name,"سمين","ضعيف")
name = string.gsub(name,"ضعيف","قوي")
name = string.gsub(name,"شريف","كواد")
name = string.gsub(name,"شجاع","جبان")
name = string.gsub(name,"رحت","اجيت")
name = string.gsub(name,"عدل","ميت")
name = string.gsub(name,"نشيط","كسول")
name = string.gsub(name,"شبعان","جوعان")
name = string.gsub(name,"موعطشان","عطشان")
name = string.gsub(name,"خوش ولد","موخوش ولد")
name = string.gsub(name,"اني","مطي")
name = string.gsub(name,"هادئ","عصبي")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يدز العكس ~ {"..name.."}","md",true)  
end
end
if text == "بات" or text == "محيبس" then   
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then 
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 » { 👊 }', data = '/Mahibes1'}, {text = '𝟐 » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '𝟑 » { 👊 }', data = '/Mahibes3'}, {text = '𝟒 » { 👊 }', data = '/Mahibes4'}, 
},
{
{text = '𝟓 » { 👊 }', data = '/Mahibes5'}, {text = '𝟔 » { 👊 }', data = '/Mahibes6'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id, [[*
𖤓︙ لعبه المحيبس هي لعبة الحظ 
𖤓︙جرب حظك ويه البوت واتونس 
𖤓︙كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]],"md",false, false, false, false, reply_markup)
end
end
if text == "خمن" or text == "تخمين" then   
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
Num = math.random(1,20)
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Estimate"..msg.chat_id..msg.sender.user_id,Num)  
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n".."𖤓︙ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n".."𖤓︙سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ ","md",true)  
end
end
if text == "المختلف" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
mktlf = {"😸","☠","🐼","🐇","🌑","🌚","⭐️","✨","⛈","🌥","⛄️","👨‍🔬","👨‍💻","👨‍🔧","🧚‍♀","??‍♂","🧝‍♂","🙍‍♂","🧖‍♂","👬","🕒","🕤","⌛️","📅",};
name = mktlf[math.random(#mktlf)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Difference"..msg.chat_id,name)
name = string.gsub(name,"😸","😹😹😹😹😹😹😹😹😸😹😹😹😹")
name = string.gsub(name,"☠","💀💀💀💀💀💀💀☠💀💀💀💀💀")
name = string.gsub(name,"🐼","👻👻👻🐼👻👻👻👻👻👻👻")
name = string.gsub(name,"🐇","🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊")
name = string.gsub(name,"🌑","🌚🌚🌚🌚🌚🌑🌚🌚🌚")
name = string.gsub(name,"🌚","🌑🌑🌑🌑🌑🌚🌑🌑🌑")
name = string.gsub(name,"⭐️","🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟??")
name = string.gsub(name,"✨","💫💫💫💫💫✨💫💫💫💫")
name = string.gsub(name,"⛈","🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨")
name = string.gsub(name,"🌥","⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️")
name = string.gsub(name,"⛄️","☃☃☃☃☃☃⛄️☃☃☃☃")
name = string.gsub(name,"👨‍🔬","👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬")
name = string.gsub(name,"👨‍💻","👩‍💻👩‍??👩‍‍💻👩‍‍??👩‍‍💻👨‍💻??‍💻👩‍💻👩‍💻")
name = string.gsub(name,"👨‍🔧","👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧")
name = string.gsub(name,"👩‍🍳","👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳??‍🍳")
name = string.gsub(name,"🧚‍♀","🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂")
name = string.gsub(name,"🧜‍♂","🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀")
name = string.gsub(name,"🧝‍♂","🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀")
name = string.gsub(name,"🙍‍♂️","🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️")
name = string.gsub(name,"🧖‍♂️","🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️")
name = string.gsub(name,"👬","👭👭👭👭👭👬👭👭👭")
name = string.gsub(name,"👨‍👨‍👧","👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦")
name = string.gsub(name,"🕒","🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒")
name = string.gsub(name,"🕤","🕥🕥🕥🕥🕥🕤🕥🕥🕥")
name = string.gsub(name,"⌛️","⏳⏳⏳⏳⏳⏳⌛️⏳⏳")
name = string.gsub(name,"📅","📆📆📆📆📆📆📅📆📆")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يدز الاختلاف ~ {"..name.."}","md",true)  
end
end
if text == "امثله" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Status:Games"..msg.chat_id) then
mthal = {"جوز","ضراطه","الحبل","الحافي","شقره","بيدك","سلايه","النخله","الخيل","حداد","المبلل","يركص","قرد","العنب","العمه","الخبز","بالحصاد","شهر","شكه","يكحله",};
name = mthal[math.random(#mthal)]
Redis:set(TheSNAYBIR.."SNAYBIR:Game:Example"..msg.chat_id,name)
name = string.gsub(name,"جوز","ينطي____للماعده سنون")
name = string.gsub(name,"ضراطه","الي يسوق المطي يتحمل___")
name = string.gsub(name,"بيدك","اكل___محد يفيدك")
name = string.gsub(name,"الحافي","تجدي من___نعال")
name = string.gsub(name,"شقره","مع الخيل يا___")
name = string.gsub(name,"النخله","الطول طول___والعقل عقل الصخلة")
name = string.gsub(name,"سلايه","بالوجه امراية وبالظهر___")
name = string.gsub(name,"الخيل","من قلة___شدو على الچلاب سروج")
name = string.gsub(name,"حداد","موكل من صخم وجهه كال آني___")
name = string.gsub(name,"المبلل","___ما يخاف من المطر")
name = string.gsub(name,"الحبل","اللي تلدغة الحية يخاف من جرة___")
name = string.gsub(name,"يركص","المايعرف___يكول الكاع عوجه")
name = string.gsub(name,"العنب","المايلوح___يكول حامض")
name = string.gsub(name,"العمه","___إذا حبت الچنة ابليس يدخل الجنة")
name = string.gsub(name,"الخبز","انطي___للخباز حتى لو ياكل نصه")
name = string.gsub(name,"باحصاد","اسمة___ومنجله مكسور")
name = string.gsub(name,"شهر","امشي__ولا تعبر نهر")
name = string.gsub(name,"شكه","يامن تعب يامن__يا من على الحاضر لكة")
name = string.gsub(name,"القرد","__بعين امه غزال")
name = string.gsub(name,"يكحله","اجه___عماها")
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙اسرع واحد يكمل المثل ~ {"..name.."}","md",true)  
end
end
if text and text:match("^بيع مجوهراتي (%d+)$") then
local NumGame = text:match("^بيع مجوهراتي (%d+)$") 
if tonumber(NumGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n*𖤓︙لا استطيع البيع اقل من 1 *","md",true)  
end
local NumberGame = Redis:get(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id)
if tonumber(NumberGame) == tonumber(0) then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ليس لديك جواهر من الالعاب \n𖤓︙اذا كنت تريد ربح الجواهر \n𖤓︙ارسل الالعاب وابدأ اللعب ! ","md",true)  
end
if tonumber(NumGame) > tonumber(NumberGame) then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙ليس لديك جواهر بهاذا العدد \n𖤓︙لزيادة مجوهراتك في اللعبه \n𖤓︙ارسل الالعاب وابدأ اللعب !","md",true)   
end
local NumberGet = (NumGame * 50)
Redis:decrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id,NumGame)  
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Message:User"..msg.chat_id..":"..msg.sender.user_id,NumGame)  
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم خصم *~ { "..NumGame.." }* من مجوهراتك \n𖤓︙وتم اضافة* ~ { "..(NumGame * 50).." } رساله الى رسالك *","md",true)  
end 
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..Message_Reply.sender.user_id, text:match("^اضف مجوهرات (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم اضافه له { "..text:match("^اضف مجوهرات (%d+)$").." } من المجوهرات").Reply,"md",true)  
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id ~= 0 then
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
if not msg.Addictive then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Message_Reply = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = LuaTele.getUser(Message_Reply.sender.user_id)
if UserInfo.message == "Invalid user ID" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return LuaTele.sendText(msg_chat_id,msg_id,"\n𖤓︙عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Message:User"..msg.chat_id..":"..Message_Reply.sender.user_id, text:match("^اضف رسائل (%d+)$"))  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender.user_id,"𖤓︙تم اضافه له { "..text:match("^اضف رسائل (%d+)$").." } من الرسائل").Reply,"md",true)  
end
if text == "مجوهراتي" then 
local Num = Redis:get(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..msg.chat_id..msg.sender.user_id) or 0
if Num == 0 then 
return LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙لم تفز بأي مجوهره ","md",true)  
else
return LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙عدد الجواهر التي ربحتها *˓ "..Num.." *","md",true)  
end
end

if text == 'ترتيب الاوامر' then
if not msg.Managers then
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n𖤓︙عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'دي','حظر')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'د','طرد')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'اش','كتم')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تنزيل الكل')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','ردود المدير')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'مك','مسح المكتومين')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'سح','مسح سحكاتي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'ت','تثبيت')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'.','غنيلي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(TheSNAYBIR.."SNAYBIR:Get:Reides:Commands:Group"..msg_chat_id..":"..'ثا','رفع مطور ثانوي')

return LuaTele.sendText(msg_chat_id,msg_id,[[*
𖤓︙تم ترتيب الاوامر بالشكل التالي ~
𖤓︙ ايدي - ا .
𖤓︙ رفع مميز - م .
𖤓︙رفع ادمن - اد .
𖤓︙ رفع مدير - مد . 
𖤓︙ رفع منشى - من . 
𖤓︙ رفع منشئ الاساسي - اس  .
𖤓︙ رفع مطور - مط .
𖤓︙رفع مطور ثانوي - ثا .
𖤓︙ حظر - دي .
𖤓︙ طرد - د .
𖤓︙ كتم - اش .
𖤓︙ تثبيت - ت .
𖤓︙ تنزيل الكل - تك .
𖤓︙ تعطيل الايدي بالصوره - تعط .
𖤓︙ تفعيل الايدي بالصوره - تفع .
𖤓︙ الرابط - ر .
𖤓︙ ردود المدير - رر .
𖤓︙ مسح المكتومين - مك .
𖤓︙ اضف رد - رد .
𖤓︙ مسح سحكاتي - سح .
𖤓︙ مسح رسائلي - رس .
𖤓︙ غنيلي - غ .
*]],"md")
end

end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات 𖤓' or text == 'تحديث' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
print('Chat Id : '..msg_chat_id)
print('User Id : '..msg_user_send_id)
LuaTele.sendText(msg_chat_id,msg_id, "𖤓︙تم تحديث الملفات","md",true)
dofile('SNAYBIR.lua')  
end
if text == '/start' then
Redis:sadd(TheSNAYBIR..'SNAYBIR:Num:User:Pv',msg.sender.user_id)  
if not msg.ControllerBot then
if not Redis:get(TheSNAYBIR.."SNAYBIR:Start:Bot") then
local CmdStart = '*\n𖤓︙أهلآ بك في بوت '..(Redis:get(TheSNAYBIR.."SNAYBIR:Name:Bot") or "روليت")..
'\n𖤓︙اختصاص البوت حماية المجموعات'..
'\n𖤓︙لتفعيل البوت عليك اتباع مايلي ...'..
'\n𖤓︙اضف البوت الى مجموعتك'..
'\n𖤓︙ارفعه ادمن {مشرف}'..
'\n𖤓︙ارسل كلمة { تفعيل } ليتم تفعيل المجموعه'..
'\n𖤓︙مطور البوت ˓ {@'..UserSudo..'}*'
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𖤓 السورس .', url = 't.me/IIH5I'},{text = '𖤓 لتنصيب بوت .', url = 't.me/m98oh8'}, 
},
{
{text = '𖤓 اضفني في مجموعتك .', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,CmdStart,"md",false, false, false, false, reply_markup)
else
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𖤓 السورس .', url = 't.me/IIH5I'},{text = '𖤓 لتنصيب بوت .', url = 't.me/m98oh8'}, 
},
{
{text = '𖤓 اضفني في مجموعتك .', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,Redis:get(TheSNAYBIR.."SNAYBIR:Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل التواصل 𖤓',type = 'text'},{text = 'تعطيل التواصل 𖤓', type = 'text'},
},
{
{text = 'تفعيل البوت الخدمي 𖤓',type = 'text'},{text = 'تعطيل البوت الخدمي 𖤓', type = 'text'},
},
{
{text = 'اذاعه للمجموعات 𖤓',type = 'text'},{text = 'اذاعه خاص 𖤓', type = 'text'},
},
{
{text = 'اذاعه بالتوجيه 𖤓',type = 'text'},{text = 'اذاعه بالتوجيه خاص 𖤓', type = 'text'},
},
{
{text = 'اذاعه بالتثبيت 𖤓',type = 'text'},
},
{
{text = 'المطورين الثانويين 𖤓',type = 'text'},{text = 'المطورين 𖤓',type = 'text'},{text = 'قائمه العام 𖤓', type = 'text'},
},
{
{text = 'مسح المطورين الثانويين 𖤓',type = 'text'},{text = 'مسح المطورين 𖤓',type = 'text'},{text = 'مسح قائمه العام 𖤓', type = 'text'},
},
{
{text = 'تغيير اسم البوت 𖤓',type = 'text'},{text = 'حذف اسم البوت 𖤓', type = 'text'},
},
{
{text = 'الاشتراك الاجباري 𖤓',type = 'text'},{text = 'تغيير الاشتراك الاجباري 𖤓',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري 𖤓',type = 'text'},{text = 'تعطيل الاشتراك الاجباري 𖤓',type = 'text'},
},
{
{text = 'الاحصائيات 𖤓',type = 'text'},{text = 'تغيير المطور الاساسي 𖤓',type = 'text'},
},
{
{text = 'تعطيل المغادره 𖤓',type = 'text'},{text = 'تفعيل المغادره 𖤓',type = 'text'},
},
{
{text = 'تغغير كليشه المطور 𖤓',type = 'text'},{text = 'حذف كليشه المطور 𖤓', type = 'text'},
},
{
{text = 'تغيير كليشه ستارت 𖤓',type = 'text'},{text = 'حذف كليشه ستارت 𖤓', type = 'text'},
},
{
{text = 'تنظيف المجموعات 𖤓',type = 'text'},{text = 'تنظيف المشتركين 𖤓', type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه 𖤓',type = 'text'},{text = 'جلب نسخه الردود 𖤓', type = 'text'},
},
{
{text = 'اضف رد عام 𖤓',type = 'text'},{text = 'حذف رد عام 𖤓', type = 'text'},
},
{
{text = 'الردود العامه 𖤓',type = 'text'},{text = 'مسح الردود العامه 𖤓', type = 'text'},
},
{
{text = 'تحديث الملفات 𖤓',type = 'text'},{text = 'تحديث السورس 𖤓', type = 'text'},
},
{
{text = 'الغاء الامر 𖤓',type = 'text'},
},
}
}
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ اهلا بك عزيزي المطور ', 'md', false, false, false, false, reply_markup)
end
end

if text == 'تنظيف المشتركين 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
local ChatAction = LuaTele.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(TheSNAYBIR..'SNAYBIR:Num:User:Pv',v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' }\n𖤓︙تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' }\n𖤓︙لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = LuaTele.getChat(v)
if Get_Chat.id then
local statusMem = LuaTele.getChatMember(Get_Chat.id,TheSNAYBIR)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
LuaTele.sendText(Get_Chat.id,0,'*𖤓︙البوت عظو في المجموعه سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(TheSNAYBIR..'SNAYBIR:ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(TheSNAYBIR..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
LuaTele.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(TheSNAYBIR..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(TheSNAYBIR..'SNAYBIR:ChekBotAdd',v)
LuaTele.leaveChat(v)
end
end
if x ~= 0 then
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' } للمجموعات \n𖤓︙تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n𖤓︙تم تعطيل المجموعه ومغادره البوت من الوهمي *',"md")
else
return LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙العدد الكلي { '..#list..' } للمجموعات \n𖤓︙لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير كليشه ستارت 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Change:Start:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ ارسل لي كليشه Start الان ","md",true)  
end
if text == 'حذف كليشه ستارت 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Start:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Change:Name:Bot"..msg.sender.user_id,300,true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ ارسل لي الاسم الان ","md",true)  
end
if text == 'حذف اسم البوت 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:Name:Bot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف اسم البوت ","md",true)   
end
if text and text:match("^تعين عدد الاعضاء (%d+)$") then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:Num:Add:Bot',text:match("تعين عدد الاعضاء (%d+)$") ) 
LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
LuaTele.sendText(msg_chat_id,msg_id,'*𖤓︙عدد احصائيات البوت الكامله \n— — — — — — — — —\n𖤓︙عدد المجموعات : '..(Redis:scard(TheSNAYBIR..'SNAYBIR:ChekBotAdd') or 0)..'\n𖤓︙عدد المشتركين : '..(Redis:scard(TheSNAYBIR..'SNAYBIR:Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تغغير كليشه المطور 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR..'SNAYBIR:GetTexting:DevTheSNAYBIR'..msg_chat_id..':'..msg.sender.user_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ ارسل لي الكليشه الان')
end
if text == 'حذف كليشه المطور 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR..'SNAYBIR:Texting:DevTheSNAYBIR')
return LuaTele.sendText(msg_chat_id,msg_id,'𖤓︙ تم حذف كليشه المطور')
end
if text == 'اضف رد عام 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Rd"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لاضافتها في ردود المطور ","md",true)  
end
if text == 'حذف رد عام 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:Set:On"..msg.sender.user_id..":"..msg_chat_id,true)
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل الان الكلمه لحذفها من ردود المطور","md",true)  
end
if text=='اذاعه خاص 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت 𖤓" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,[[
↯︰ارسل لي سواء كان 
❨ ملف • ملصق • متحركه • صوره
 • فيديو • بصمه الفيديو • بصمه • صوت • رساله ❩
— — — — — — — — —
↯︰للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه 𖤓" then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي التوجيه الان\n𖤓︙ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص 𖤓' then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:setex(TheSNAYBIR.."SNAYBIR:Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender.user_id, 600, true) 
LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙ارسل لي التوجيه الان\n𖤓︙ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه 𖤓") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋??𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
text = "\n📝︰قائمة ردود المطور \n— — — — — — — — —\n"
for k,v in pairs(list) do
if Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..v) then
db = "ملف 𖤓"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "𖤓︙لا توجد ردود للمطور"
end
return LuaTele.sendText(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامه 𖤓") then 
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Gif"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:vico"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:stekr"..v)     
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Text"..v)   
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Photo"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Video"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:File"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:Audio"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:Add:Rd:Sudo:video_note"..v)
Redis:del(TheSNAYBIR.."SNAYBIR:List:Rd:Sudo")
end
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم حذف ردود المطور","md",true)  
end
if text == 'مسح المطورين 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح قائمه العام 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
return LuaTele.sendText(msg_chat_id,msg_id,"*𖤓︙تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:BotFree") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:del(TheSNAYBIR.."SNAYBIR:TwaslBot") 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:BotFree",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
Redis:set(TheSNAYBIR.."SNAYBIR:TwaslBot",true) 
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end 
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه المحظورين عام  \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
var(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = msg.sender.user_id..'/BanAll'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه مطورين البوت \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين 𖤓' then
if not msg.ControllerBot then 
return LuaTele.sendText(msg_chat_id,msg_id,'\n*𖤓︙هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '٬ 𝖼𝗅𝗂𝖼𝗄 𝗍𝗈 𝗌𝗎𝖻𝗌𝖼𝗋𝗂𝖻𝖾 † ٫ ', url = 't.me/'..Redis:get(TheSNAYBIR..'SNAYBIR:Channel:Join')}, },}}
return LuaTele.sendText(msg.chat_id,msg.id,'*\n 𝗐𝖾𝗅𝖼𝗈𝗆𝖾 𝗉𝗋𝗈 🦎.*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
if #Info_Members == 0 then
return LuaTele.sendText(msg_chat_id,msg_id,"𖤓︙لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*𖤓︙قائمه مطورين البوت \n — — — — — — — — —*\n'
for k, v in pairs(Info_Members) do
local UserInfo = LuaTele.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = msg.sender.user_id..'/Developers'},},}}
return LuaTele.sendText(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.ControllerBot then
if Redis:get(TheSNAYBIR.."SNAYBIR:TwaslBot") and not Redis:sismember(TheSNAYBIR.."SNAYBIR:BaN:In:Tuasl",msg.sender.user_id) then
local ListGet = {Sudo_Id,msg.sender.user_id}
local IdSudo = LuaTele.getChat(ListGet[1]).id
local IdUser = LuaTele.getChat(ListGet[2]).id
local FedMsg = LuaTele.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(TheSNAYBIR.."SNAYBIR:Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
LuaTele.sendText(IdSudo,0,Reply_Status(IdUser,'𖤓︙قام بارسال الملصق').Reply,"md",true)  
end
return LuaTele.sendText(IdUser,msg_id,Reply_Status(IdUser,'𖤓︙تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(TheSNAYBIR.."SNAYBIR:Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(TheSNAYBIR..'SNAYBIR:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖤓︙تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(TheSNAYBIR..'SNAYBIR:BaN:In:Tuasl',Info_User)  
return LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖤓︙تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = LuaTele.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖤓︙قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
LuaTele.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
LuaTele.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
LuaTele.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
LuaTele.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
LuaTele.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
LuaTele.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
LuaTele.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
LuaTele.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
LuaTele.sendText(Info_User,0,text,"md",true)
end 
LuaTele.sendText(msg_chat_id,msg_id,Reply_Status(Info_User,'𖤓︙تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run


function CallBackLua(data) --- هذا الكالباك بي الابديت
--var(data) 
if data and data.luatele and data.luatele == "updateSupergroup" then
local Get_Chat = LuaTele.getChat('-100'..data.supergroup.id)
if data.supergroup.status.luatele == "chatMemberStatusBanned" then
Redis:srem(TheSNAYBIR.."SNAYBIR:ChekBotAdd",'-100'..data.supergroup.id)
local keys = Redis:keys(TheSNAYBIR..'*'..'-100'..data.supergroup.id)
for i = 1, #keys do
Redis:del(keys[i])
end
return LuaTele.sendText(Sudo_Id,0,'*\n𖤓︙تم طرد البوت من مجموعه جديده \n𖤓︙اسم المجموعه : '..Get_Chat.title..'\n𖤓︙ايدي المجموعه :*`-100'..data.supergroup.id..'`\n𖤓︙تم مسح جميع البيانات المتعلقه بالمجموعه',"md")
end
elseif data and data.luatele and data.luatele == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id) then
LuaTele.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(TheSNAYBIR.."SNAYBIR:PinMsegees:"..msg.chat_id)
end
end

elseif data and data.luatele and data.luatele == "updateNewMessage" then
if data.message.content.luatele == "messageChatDeleteMember" or data.message.content.luatele == "messageChatAddMembers" or data.message.content.luatele == "messagePinMessage" or data.message.content.luatele == "messageChatChangeTitle" or data.message.content.luatele == "messageChatJoinByLink" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..data.message.chat_id) then
LuaTele.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
File_Bot_Run(data.message,data.message)

elseif data and data.luatele and data.luatele == "updateMessageEdited" then
-- data.chat_id -- data.message_id
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender.user_id == TheSNAYBIR then
print('This is Edit for Bot')
return false
end
File_Bot_Run(Message_Edit,Message_Edit)
Redis:incr(TheSNAYBIR..'SNAYBIR:Num:Message:Edit'..data.chat_id..Message_Edit.sender.user_id)
if Message_Edit.content.luatele == "messageContact" or Message_Edit.content.luatele == "messageVideoNote" or Message_Edit.content.luatele == "messageDocument" or Message_Edit.content.luatele == "messageAudio" or Message_Edit.content.luatele == "messageVideo" or Message_Edit.content.luatele == "messageVoiceNote" or Message_Edit.content.luatele == "messageAnimation" or Message_Edit.content.luatele == "messagePhoto" then
if Redis:get(TheSNAYBIR.."SNAYBIR:Lock:edit"..data.chat_id) then
LuaTele.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id

if Text and Text:match('idu@(%d+)msg@(%d+)@id@(.*)') then
local listYt = {Text:match('idu@(%d+)msg@(%d+)@id@(.*)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = ' { Ogg - بصمه }', data = 'oggidu@'..IdUser..'idv@'..listYt[3]}, 
},
{
{text = ' { Mp3 - ملف صوتي }', data = 'mp3idu@'..IdUser..'idv@'..listYt[3]},  {text = ' { Mp4 - فيديو }', data = 'mp4idu@'..IdUser..'idv@'..listYt[3]}, 
},
{
{text = '{ الغاء الامر }', data = 'idu@'..IdUser..'delamr'},
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,'*𖤓︙عليك اختيار احدى الصيغ للتنزبل *', 'md', true, false, reply_markup)
end
end
if Text and Text:match('oggidu@(%d+)idv@(.*)') then
local listYt = {Text:match('oggidu@(%d+)idv@(.*)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
io.popen('curl -s "https://devstorm.ml/youtube/yt3.php?url='..listYt[2]..'&token='..Token..'&chat='..ChatId..'&type=ogg&msg=0"')
end
end
if Text and Text:match('mp3idu@(%d+)idv@(.*)') then
local listYt = {Text:match('mp3idu@(%d+)idv@(.*)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
io.popen('curl -s "https://devstorm.ml/YoutubeApi/yt2.php?url='..listYt[2]..'&token='..Token..'&chat='..ChatId..'&type=mp3&msg=0"')
end
end
if Text and Text:match('mp4idu@(%d+)idv@(.*)') then
local listYt = {Text:match('mp4idu@(%d+)idv@(.*)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
io.popen('curl -s "https://devstorm.ml/youtube/yt3.php?url='..listYt[2]..'&token='..Token..'&chat='..ChatId..'&type=mp4&msg=0"')
end
end
if Text and Text:match('idu@(%d+)delamr') then
local listYt = Text:match('idu@(%d+)delamr') 
if tonumber(listYt) == tonumber(IdUser) then
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end


if Text and Text:match('(%d+)/unbanktmkid@(%d+)') then
local listYt = {Text:match('(%d+)/unbanktmkid@(%d+)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
Redis:srem(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..ChatId,listYt[2]) 
Redis:srem(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..ChatId,listYt[2]) 
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1,1})
LuaTele.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1})
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم رفع القيود عنه", 'md')
end
end

if Text and Text:match('(%d+)/delamrredis') then
local listYt = Text:match('(%d+)/delamrredis')
if tonumber(listYt) == tonumber(IdUser) then
Redis:del(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..ChatId..""..IdUser) 
Redis:del(TheSNAYBIR.."SNAYBIR1:Set:Rd"..IdUser..":"..ChatId)
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(TheSNAYBIR.."SNAYBIR:Set:Rd"..IdUser..":"..ChatId)
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم الغاء الامر", 'md')
end
end
if Text and Text:match('(%d+)/chenid') then
local listYt = Text:match('(%d+)/chenid')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(TheSNAYBIR.."SNAYBIR:Redis:Id:Group"..ChatId..""..IdUser,true) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙ارسل لي الايدي الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplygg') then
local listYt = Text:match('(%d+)/chengreplygg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(TheSNAYBIR.."SNAYBIR1:Set:Rd"..IdUser..":"..ChatId, "true")
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplyg') then
local listYt = Text:match('(%d+)/chengreplyg')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Manager:rd"..IdUser..":"..ChatId,"true")
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙ارسل لي الرد الان", 'md', true)
end
end
if Text and Text:match('(%d+)/chengreplys') then
local listYt = Text:match('(%d+)/chengreplys')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(TheSNAYBIR.."SNAYBIR:Set:Rd"..IdUser..":"..ChatId,true)
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙ارسل لي الرد الان", 'md', true)
end
end

if Text and Text:match('(%d+)/Re@') then
local UserId = Text:match('(%d+)/Re@')
if tonumber(IdUser) == tonumber(UserId) then
Abs = math.random(2,140); 
local Text ='*𖤓︙تم اختيار الاغنيه لك*'
local msg_id = Msg_id/2097152/0.5
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'التالي 𖤓', callback_data = IdUser..'/Re@'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT',url="t.me/IIH5I"}
},
}
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. ChatId .. '&voice=https://t.me/TEAMSUL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end

if Text and Text:match('(%d+)/ban0') then
local UserId = Text:match('(%d+)/ban0')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 0 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban1'},{text = ' صورتك السابقه ', callback_data =IdUser..'/delAmr'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban89') then
local UserId = Text:match('(%d+)/ban89')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban_ns = 'ᯏ'
if photo.total_count > 1 then
GH = '* '..photo.photos[2].sizes[#photo.photos[1].sizes].photo.remote.id..'* '
ban = JSON.encode(GH)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
}
https.request("https://api.telegram.org/bot"..Token.."/editMessageMedia?chat_id="..ChatId.."&reply_to_message_id=0&media="..ban.."&caption=".. URL.escape(ban_ns).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban1') then
local UserId = Text:match('(%d+)/ban1')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban2'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban0'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[2].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban2') then
local UserId = Text:match('(%d+)/ban2')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban3'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban1'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[3].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban3') then
local UserId = Text:match('(%d+)/ban3')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban4'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban2'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[4].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban4') then
local UserId = Text:match('(%d+)/ban4')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban5'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban3'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[5].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban5') then
local UserId = Text:match('(%d+)/ban5')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = '𝚑𝚎??𝚎 𝚊𝚛𝚎 𝚢𝚘𝚞𝚛 𝚙𝚑𝚘𝚝𝚘𝚜'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban6'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban4'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[6].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if Text and Text:match('(%d+)/ban6') then
local UserId = Text:match('(%d+)/ban6')
if tonumber(IdUser) == tonumber(UserId) then
local photo = LuaTele.getUserProfilePhotos(IdUser)
local ban = LuaTele.getUser(IdUser)
if photo.total_count > 1 then
local ban_ns = 'ᯏ'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اخفاء 𖤓', callback_data =IdUser..'/delAmr'}, 
},
{
{text = ' صورتك القادمه ', callback_data =IdUser..'/ban7'},{text = ' صورتك السابقه ', callback_data =IdUser..'/ban5'}, 
},
}
LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. ChatId .. "&photo="..photo.photos[7].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(ban_ns).."&reply_to_message_id=0&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return LuaTele.sendText(ChatId,Msg_id,'*𖤓︙ لا توجد صوره ف حسابك*',"md",true) 
end
end
end


if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(TheSNAYBIR.."SNAYBIR:Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = '*𖤓︙الف مبروك حظك حلو اليوم\n𖤓︙فزت ويانه وطلعت المحيبس بل عظمه رقم {'..NumMahibes..'}*'
else
MahibesText = '*𖤓︙للاسف لقد خسرت المحيبس بالعظمه رقم {'..NumMahibes..'}\n𖤓︙جرب حضك ويانه مره اخره*'
end
if NumMahibes == 1 then
Mahibes1 = '🤚' else Mahibes1 = '👊'
end
if NumMahibes == 2 then
Mahibes2 = '🤚' else Mahibes2 = '👊'
end
if NumMahibes == 3 then
Mahibes3 = '🤚' else Mahibes3 = '👊' 
end
if NumMahibes == 4 then
Mahibes4 = '🤚' else Mahibes4 = '👊'
end
if NumMahibes == 5 then
Mahibes5 = '🤚' else Mahibes5 = '👊'
end
if NumMahibes == 6 then
Mahibes6 = '🤚' else Mahibes6 = '👊'
end
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 » { '..Mahibes1..' }', data = '/*'}, {text = '𝟐 » { '..Mahibes2..' }', data = '/*'}, 
},
{
{text = '𝟑 » { '..Mahibes3..' }', data = '/*'}, {text = '𝟒 » { '..Mahibes4..' }', data = '/*'}, 
},
{
{text = '𝟓 » { '..Mahibes5..' }', data = '/*'}, {text = '𝟔 » { '..Mahibes6..' }', data = '/*'}, 
},
{
{text = '{ اللعب مره اخرى }', data = '/MahibesAgane'},
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text == "/MahibesAgane" then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '𝟏 » { 👊 }', data = '/Mahibes1'}, {text = '𝟐 » { 👊 }', data = '/Mahibes2'}, 
},
{
{text = '𝟑 » { 👊 }', data = '/Mahibes3'}, {text = '𝟒 » { 👊 }', data = '/Mahibes4'}, 
},
{
{text = '𝟓 » { 👊 }', data = '/Mahibes5'}, {text = '𝟔 » { 👊 }', data = '/Mahibes6'}, 
},
}
}
local TextMahibesAgane = [[*
𖤓︙ لعبه المحيبس هي لعبة الحظ 
𖤓︙جرب حظك ويه البوت واتونس 
𖤓︙كل ما عليك هوا الضغط على احدى العضمات في الازرار
*]]
return LuaTele.editMessageText(ChatId,Msg_id,TextMahibesAgane, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙•أوامر الحماية• اتبع مايلي ...
— — — — — — — — —
𖤓︙قفل ، فتح ˓ الامر 
𖤓︙تستطيع قفل حمايه كما يلي ...
𖤓︙˓ { بالتقيد ، بالطرد ، بالكتم }
— — — — — — — — —
𖤓︙الروابط
𖤓︙المعرف
𖤓︙التاك
𖤓︙الشارحه
𖤓︙التعديل
𖤓︙التثبيت
𖤓︙المتحركه
𖤓︙الملفات
𖤓︙الصور
— — — — — — — — —
𖤓︙الماركداون
𖤓︙البوتات
𖤓︙التكرار
𖤓︙الكلايش
𖤓︙السيلفي
𖤓︙الملصقات
𖤓︙الفيديو
𖤓︙الانلاين
𖤓︙الدردشه
— — — — — — — — —
𖤓︙التوجيه
𖤓︙الاغاني
𖤓︙الصوت
𖤓︙الجهات
𖤓︙الاشعارات
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙اوامر ادمنية المجموعه ...
— — — — — — — — —
𖤓︙رفع، تنزيل ˓ مميز
𖤓︙تاك للكل ، عدد الكروب
𖤓︙كتم ، حظر ، طرد ، تقيد
𖤓︙الغاء كتم ، الغاء حظر ، الغاء تقيد
𖤓︙منع ، الغاء منع 
— — — — — — — — —
𖤓︙عرض القوائم كما يلي ...
— — — — — — — — —
𖤓︙المكتومين
𖤓︙المميزين 
𖤓︙قائمه المنع
— — — — — — — — —
𖤓︙تثبيت ، الغاء تثبيت
𖤓︙الرابط ، الاعدادات
𖤓︙الترحيب ، القوانين
𖤓︙تفعيل ، تعطيل ˓ الترحيب
𖤓︙تفعيل ، تعطيل ˓ الرابط
𖤓︙جهاتي ،ايدي ، رسائلي
𖤓︙سحكاتي ، مجوهراتي
𖤓︙كشف البوتات
— — — — — — — — —
𖤓︙وضع ، ضع ˓ الاوامر التاليه 
𖤓︙اسم ، رابط ، صوره
𖤓︙قوانين ، وصف ، ترحيب
— — — — — — — — —
𖤓︙حذف ، مسح ˓ الاوامر التاليه
𖤓︙قائمه المنع ، المحظورين 
𖤓︙المميزين ، المكتومين ، القوانين
𖤓︙المطرودين ، البوتات ، الصوره
𖤓︙الرابط
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙•أوامر المدراء• في المجموعه
— — — — — — — — —
𖤓︙رفع ، تنزيل ˓ ادمن
𖤓︙الادمنيه 
𖤓️︰رفع، كشف ˓ القيود
𖤓︙تنزيل الكل ˓ { بالرد ، بالمعرف }
— — — — — — — — —
𖤓︙لتغيير رد الرتب في البوت
— — — — — — — — —
𖤓︙تغير رد ˓ {اسم الرتبه والنص} 
𖤓︙المطور ، المنشئ الاساسي
𖤓︙المنشئ ، المدير ، الادمن
𖤓︙المميز ، العضو
— — — — — — — — —
𖤓︙تفعيل ، تعطيل ˓ الاوامر التاليه ↓
— — — — — — — — —
𖤓︙الايدي ، الايدي بالصوره
𖤓︙ردود المطور ، ردود المدير
𖤓︙اطردني ، الالعاب ، الرفع
𖤓︙الحظر ، الرابط ، امسح
𖤓︙جمالي ، صورتي ، كول
— — — — — — — — —
𖤓︙تعين ، مسح ˓{ الايدي }
𖤓︙رفع الادمنيه ، مسح الادمنيه
𖤓︙ردود المدير ، مسح ردود المدير
𖤓︙اضف ، حذف ˓ { رد }
𖤓︙تنظيف ˓ { عدد }
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help4') then
local UserId = Text:match('(%d+)/help4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙اوامر المنشئ الاساسي
— — — — — — — — —
𖤓︙رفع ، تنزيل ˓{ منشئ }
𖤓︙المنشئين ، مسح المنشئين
— — — — — — — — —
𖤓︙اوامر المنشئ المجموعه
— — — — — — — — —
𖤓︙رفع ، تنزيل ˓ { مدير }
𖤓︙المدراء ، مسح المدراء
𖤓︙اضف رسائل ˓ { بالرد او الايدي }
𖤓︙اضف مجوهرات ˓ { بالرد او الايدي }
𖤓︙اضف ، حذف ˓ { امر }
𖤓︙الاوامر المضافه ، مسح الاوامر المضافه
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help5') then
local UserId = Text:match('(%d+)/help5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙اوامر المطور الاساسي  
— — — — — — — — —
𖤓︙حظر عام ، الغاء العام
𖤓︙اضف ، حذف ˓ { مطور } 
𖤓︙قائمه العام ، مسح قائمه العام
𖤓︙المطورين ، مسح المطورين
— — — — — — — — —
𖤓︙اضف ، حذف ˓ { رد للكل }
𖤓︙وضع ، حذف ˓ { كليشه المطور } 
𖤓︙مسح ردود المطور ، ردود المطور 
𖤓︙تحديث ،  تحديث السورس 
𖤓︙تعين عدد الاعضاء ˓ { العدد }
— — — — — — — — —
𖤓︙تفعيل ، تعطيل ˓ { الاوامر التاليه ↓}
𖤓︙البوت الخدمي ، المغادرة ، الاذاعه
𖤓︙ملف ˓ { اسم الملف }
— — — — — — — — —
𖤓︙مسح جميع الملفات 
𖤓︙المتجر ، الملفات
— — — — — — — — —
𖤓︙اوامر المطور في البوت
— — — — — — — — —
𖤓︙تفعيل ، تعطيل ، الاحصائيات
𖤓︙رفع، تنزيل ˓ { منشئ اساسي }
𖤓︙مسح الاساسين ، المنشئين الاساسين 
𖤓︙غادر ، غادر ˓ { والايدي }
𖤓︙اذاعه ، اذاعه بالتوجيه ، اذاعه بالتثبيت
𖤓︙اذاعه خاص ، اذاعه خاص بالتوجيه 
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help6') then
local UserId = Text:match('(%d+)/help6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙قائمه الالعاب البوت
— — — — — — — — —
𖤓︙لعبة المختلف » المختلف
𖤓︙لعبة الامثله » امثله
𖤓︙لعبة العكس » العكس
𖤓︙لعبة الحزوره » حزوره
𖤓︙لعبة المعاني » معاني
𖤓︙لعبة البات » بات
𖤓︙لعبة التخمين » خمن
𖤓︙لعبه الاسرع » الاسرع
𖤓︙لعبة السمايلات » سمايلات
𖤓︙لعبة كت تويت » كت
𖤓︙لعبة الحروف » حرف
𖤓︙لعبة لو خيروك » خيرني
— — — — — — — — —
𖤓︙قائمه العاب التسليه

𖤓︙غنيلي
𖤓︙اغنيه
𖤓︙متحركه
𖤓︙ريمكس
𖤓︙ميمز
𖤓︙صوره
𖤓︙فلم
— — — — — — — — —
𖤓︙مجوهراتي ˓ لعرض عدد الارباح
𖤓︙بيع مجوهراتي ˓ { العدد } ˓ لبيع كل مجوهره مقابل {50} رساله
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = '•أوامر الحماية•', data = IdUser..'/help1'}, {text = '•أوامر الادمنية•', data = IdUser..'/help2'}, 
},
{
{text = '•أوامر المدراء•', data = IdUser..'/help3'}, {text = '•أوامر المنشئين•', data = IdUser..'/help4'}, 
},
{
{text = '•أوامر المطور•', data = IdUser..'/help5'}, {text = '•الالعاب والتسليه•', data = IdUser..'/help6'}, 
},
{
{text = 'رجوع 𖤓 ', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},

{
{text = '𖤓 SٌِAَِUَِٰٓRِْSَِE َِٓRِٔOَِUَِٰLَِٕ̑̈EَٕT', url = 't.me/IIH5I'}, 
},
}
}
local TextHelp = [[*
𖤓︙توجد ← 5 اوامر في البوت
— — — — — — — — —
𖤓︙ارسل { م1 } ← اوامر الحمايه
𖤓︙ارسل { م2 } ← اوامر الادمنيه
𖤓︙ارسل { م3 } ← اوامر المدراء
𖤓︙ارسل { م4 } ← اوامر المنشئين
𖤓︙ارسل { م5 } ← اوامر مطورين البوت
*]]
LuaTele.editMessageText(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Join"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:lockpin"..ChatId,(LuaTele.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..ChatId,true)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:edit"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId,"del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end

if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId,"ked")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId,"ktm")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Audio"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId,"kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Link"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Welcome"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Id"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Reply"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر ردود المدير").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر ردود المطور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mostaf_sasa') then
local UserId = Text:match('(%d+)/mostaf_sasa')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = '`ʙᴀᴄᴋ´', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"*𖤓︙ تم تعطيل ردود السورس *").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:SetId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:BanId"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:Games"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Status:KickMe"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Link"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Welcome"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Id"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:IdPhoto"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Reply"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر ردود المدير").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:ReplySudo"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر ردود المطور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:SetId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:BanId"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:Games"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(TheSNAYBIR.."SNAYBIR:Status:KickMe"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'listallAddorrem'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = LuaTele.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(TheSNAYBIR.."SNAYBIR:Addictive:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم ترقيه {"..y.."} ادمنيه \n𖤓︙تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(TheSNAYBIR.."SNAYBIR:Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(TheSNAYBIR..'SNAYBIR:'..lock..UserId[2],"del")    
end
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم قفل جميع الاوامر بنجاح  ", true)
end
end
if Text and Text:match('/Zxchq(.*)') then
local UserId = Text:match('/Zxchq(.*)')
LuaTele.answerCallbackQuery(data.id, "𖤓︙ تم مغادره البوت من المجموعه", true)
LuaTele.leaveChat(UserId)
end
if Text and Text:match('(%d+)/Redis') then
local UserId = Text:match('(%d+)/Redis')
LuaTele.answerCallbackQuery(data.id, "𖤓︙ تم الغاء الامر بنجاح", true)
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ❌ ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ✔️ ❭',nil,nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ❌ ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ✔️ ❭',nil,nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ❌ ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ✔️ ❭',nil,nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ❌ ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ✔️ ❭',nil,nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ❌ ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ✔️ ❭',nil)
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ❌ ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
LuaTele.answerCallbackQuery(data.id, "𖤓︙تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ✔️ ❭')
LuaTele.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
LuaTele.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
LuaTele.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'تعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل ردود المدير', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل ردود المدير', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل ردود المطور', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل ردود المطور', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = 'رجوع 𖤓', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
}
}
return LuaTele.editMessageText(ChatId,Msg_id,'𖤓︙اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖤓︙اعدادات المجموعه ".."\n🔏︰علامة ال (✔️) تعني مقفول".."\n🔓︰علامة ال (❌) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- الرجوع ... ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = 'رجوع 𖤓', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =msg.sender.user_id..'/'.. 'delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n𖤓︙اعدادات المجموعه ".."\n🔏︰علامة ال (✔️) تعني مقفول".."\n𖤓︙علامة ال (❌) تعني مفتوح*"
local reply_markup = LuaTele.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = 'التالي 🔁. ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = 'رجوع 𖤓', data = IdUser..'/helpall'},
},
{
{text = 'اخفاء 𖤓', data =IdUser..'/'.. 'delAmr'}
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end 
if Text and Text:match('(%d+)/delAmr') then
local UserId = Text:match('(%d+)/delAmr')
if tonumber(IdUser) == tonumber(UserId) then
return LuaTele.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Link"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Spam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Keyboard"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:vico"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Animation"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Document"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:text"..ChatId,true) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Video"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Photo"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:User:Name"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:hashtak"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Bot:kick"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:forward"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Audio"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Sticker"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Contact"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Join"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:AddMempar"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Unsupported"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:lockpin"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:tagservr"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:Markdaun"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:edit"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Lock:geam"..ChatId)  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(TheSNAYBIR.."SNAYBIR:Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,Reply_Status(IdUser,"𖤓︙تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Developers') then
local UserId = Text:match('(%d+)/Developers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Developers:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح مطورين البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/DevelopersQ') then
local UserId = Text:match('(%d+)/DevelopersQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:DevelopersQ:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح مطورين الثانوين من البوت", 'md', false)
end
elseif Text and Text:match('(%d+)/TheBasicsQ') then
local UserId = Text:match('(%d+)/TheBasicsQ')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:TheBasicsQ:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"*𖤓︙تم مسح المالكين *", 'md', false)
end
elseif Text and Text:match('(%d+)/TheBasics') then
local UserId = Text:match('(%d+)/TheBasics')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:TheBasics:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المنشئين الاساسيين", 'md', false)
end
elseif Text and Text:match('(%d+)/Originators') then
local UserId = Text:match('(%d+)/Originators')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Originators:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح منشئين المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/Managers') then
local UserId = Text:match('(%d+)/Managers')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Managers:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المدراء", 'md', false)
end
elseif Text and Text:match('(%d+)/Addictive') then
local UserId = Text:match('(%d+)/Addictive')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Addictive:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح ادمنيه المجموعه", 'md', false)
end
elseif Text and Text:match('(%d+)/DelDistinguished') then
local UserId = Text:match('(%d+)/DelDistinguished')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:Distinguished:Group"..ChatId) 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'رجوع ➡️', data =UserId..'/'.. 'NoNextSeting'},},}}
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المميزين", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:BanAll:Groups") 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المحظورين عام", 'md', false)
end
elseif Text and Text:match('(%d+)/BanGroup') then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:BanGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المحظورين", 'md', false)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(TheSNAYBIR.."SNAYBIR:SilentGroup:Group"..ChatId) 
LuaTele.editMessageText(ChatId,Msg_id,"𖤓︙تم مسح المكتومين", 'md', false)
end
end

end
end


luatele.run(CallBackLua)
 





