Config = {}


------------------------------MAIN ---------
Config.Framework = "esx" -- newqb, oldqb, esx
Config.NewESX = true
Config.Mysql = 'oxmysql' --  ghmattimysql -- mysql-async -- oxmysql
Config.Command = 'report'
Config.AdminCommand = 'adminreport'
Config.Adminimage = "https://cdn.discordapp.com/attachments/983471660684423240/1013925346640416768/asistan.png"
Config.Playerimage = "https://cdn.discordapp.com/attachments/998616334239797338/1014523331153756210/Mask_group_1.png"

Config.UseManuelAdmin = false -- If you want to add admin manually, set it to true, if you want to add admin automatically, set it to false.
Config.Admin = { -- Admins Manual
   --EXAPMLES--
   -- https://cdn.discordapp.com/attachments/983471660684423240/1014580268197228715/unknown.png
   --Type whatever it says in the users section
   -- 'YVF83936',
   -- 'steam:11000010affb348'
   --'steam:1100001158a2a55'
   'OLF77889',
}

Config.CheckPermissions = function() -- Auto Admins, if you want use this, set Config.UseManuelAdmin to false
   if Config.Framework == "esx" then
      Config.AdminPermissions = {
         "superadmin",
         "admin",
         "mod",
      }
   else
      Config.AdminPermissions = {
         "god",
         "admin",
      }
   end
end


---- DİSCORD WEBHOOK ---
Config.PlayerWebhook = "https://discord.com/api/webhooks/1073370650128953414/TTx8k-ecbX4DdavnoKlWMRjn7KWz4EWTSNGAh2r3zZSq6LzXUfLXQ1F4M4LKQ6z8Wr9T"
Config.IconURL = "https://cdn.discordapp.com/attachments/862018783391252500/943983046347063316/Patreon_Logo_3.png"
Config.Logo = "https://cdn.discordapp.com/attachments/862018783391252500/943983046347063316/Patreon_Logo_3.png"
Config.Botname = "Report Log"


Config.Notifications = { -- Notifications
   ["add_report"] = {
      message = 'A repor has been opened.',
      type = "success",
   },
   ["add_report_admin"] = {
      message = 'A new report has been opened.',
      type = "success",
   },
   ["usercall"] = {
      message = 'You have a call waiting for to approve',
      type = "success",
   },
   ["report_admin_close"] = {
      message = 'Call has been successfully ended',
      type = "success",
   },
   ["usercallwait"] = {
      message = 'Call log  successfully received.',
      type = "success",
   },
   ["callmessage"] = {
      message = 'A message came from Livecall',
      type = "success",
   },
   ["reportmessage"] = {
      message = 'Your report has been answered.',
      type = "success",
   },
   ["takecase"] = {
      message = 'To answer report go to My Report Case.',
      type = "success",
   },
   ["adminopenreport"] = {
      message = 'Your report has been approved by admin.',
      type = "success",
   },
   ["closedticket"] = {
      message = 'Ticket closed..',
      type = "success",
   },
   ["closedticketadmin"] = {
      message = 'Your ticket has been closed by admin.',
      type = "success",
   },
   ["closedticketplayer"] = {
      message = 'Your ticket has been closed by player.',
      type = "success",
   },
   ["adminnotify"] = {
      message = 'A message came from admin chat.',
      type = "success",
   },
   ["newcall"] = {
      message = 'You have a waiting call.',
      type = "success",
   },
   ["newcallplayer"] = {
      message = 'A message came from Livecall.',
      type = "success",
   },
   ["closedticketmessage"] = {
      message = 'This ticket has been closed.',
      type = "success",
   },
   ["openedadminmessage"] = {
      message = 'Live call has been approved by an admin.',
      type = "success",
   },
}


Config.Locale = {
   ["HELLO"] = 'Hello',
   ["ADMIN_CHAT"] = 'Admin Chat',
   ["ONLINE_ADMINS"] = 'Online Admins',
   ["CREATE NEW REPORT"] = '+ Create New Report',
   ["MY_REPORT_CASES"] = 'My Report Cases',
   ["HOME_PAGE"] = 'Home Page',
   ["MY_REPORTS"] = 'My Reports',
   ["BUG_REPORTS"] = 'Bug Reports',
   ["PLAYER_REPORTS"] = 'Player Reports',
   ["OTHER_REPORTS"] = 'Other Reports',
   ["ADMINS"] = 'Admins',
   ["BUG"] = 'Bug',
   ["PLAYER"] = 'Player',
   ["OTHER"] = 'Other',
   ["SCREENSHOT"] = 'Screenshot',
   ["CANCEL"] = 'Cancel',
   ["CHAT_WITH_ADMIN"] = 'Chat with admin',
   ["CHAT_WITH_ADMIN_CHAT"] = 'You are on admin chat.',
   ["CHAT_WITH_USER"] = 'Chat with user',
   ["ENTER"] = 'Enter',
   ["SUBMIT"] = 'Submit',
   ["CLOSE"] = 'Close',
   ["CLOSE_REPORT"] = 'Close Report',
   ["YOU_ARE_WAITING"] = 'You are waiting your live call to answered by admins.',
   ["TICKET_FEEDBACK"] = 'Please give some feedback to admin',
   ["GO_BACK"] = 'Go Back',
   ["ACTIVE_REPORTS"] = 'Active Reports',
   ["CLOSED_REPORTS"] = 'Closed Reports',
   ["ACTIVE_CALLS"] = 'Active Calls',
   ["CLOSED_CALLS"] = 'Closed Calls',
   ["TAKE_CASE"] = 'Take Case',
   ["CLICK_HERE"] = 'Click here to shrink the image',
   ["REPORT_ADMIN"] = 'Report admin : ',
   ["USER_FEEDBACK"] = 'User Feedback',
   ["GOTO"] = 'Go To',
   ["BRING"] = 'Bring',
   ["SOLVED"] = 'Mark as solved',
   ["CHAT_WITH_ADMIN"] = 'You are at live chat with admin',
   ["LIVE_CHAT"] = 'Live chat with ',
   ["ASISTAN"] = 'I would like to contact with live asistant',
   ["ASISTAN1"] = 'Live Asistant Calls',
   ["ASISTAN2"] = 'My Calls.',
   ["ASISTAN3"] = ' s Calls',
   ["REPORT_TYPE"] = 'Please Select a report type',
   ["REPORT_TYPE_BUG"] = 'You are reporting a bug',
   ["ADMIN_PROFILE"] = 'Please select a category to see ',
   ["ADMIN_PROFILE2"] = ' report cases',
   ["MY_CASES"] = 'Plase select a category to see your report cases',
   ["REPORT_TYPE_PLAYER"] = 'You are reporting a player.',
   ["REPORT_TYPE_OTHER"] = 'You are reporting a other.',
   ["YOU_ARE_VIEWING_YOUR"] = 'You are viewing your.',
   ["YOU_ARE_VIEWING"] = 'You are viewing ',
   ["CALL"] = 'Call',
   ["CALL_FROM_NAME"] = 'Call from name',
   ["END_CALL"] = 'End Call',


}



Config.Notification = function(message, type, isServer, src) -- You can change here events for notifications
   if isServer then
      if Config.Framework == "esx" then
         TriggerClientEvent("esx:showNotification", src, message)
      else
         TriggerClientEvent('QBCore:Notify', src, message, type, 1500)
      end
   else
      if Config.Framework == "esx" then
         TriggerEvent("esx:showNotification", message)
      else
         TriggerEvent('QBCore:Notify', message, type, 1500)
      end
   end
end



function GetIdentifier(source)
   if Config.Framework == "esx" then
      local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))

      if xPlayer then
         return xPlayer.getIdentifier()
      else
         return "0"
      end
   else
      local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
      if Player then
         return Player.PlayerData.citizenid
      else
         return "0"
      end
   end
end

function GetName(source)
   if Config.Framework == "esx" then
      local xPlayer = frameworkObject.GetPlayerFromId(tonumber(source))
      if xPlayer then
         return xPlayer.getName()
      else
         return "0"
      end
   else
      local Player = frameworkObject.Functions.GetPlayer(tonumber(source))
      if Player then
         return Player.PlayerData.charinfo.firstname .. ' ' ..Player.PlayerData.charinfo.lastname
      else
         return "0"
      end
   end
end


function adminCheck(identifier,permissions,source)
   if Config.UseManuelAdmin then
      for k, v in pairs(Config.Admin) do
         if v == identifier then
            return true
         end
      end
      return false
   else
      if Config.Framework == "esx" then
         if source then
            local Player = frameworkObject.GetPlayerFromId(source)
            if Player then
               if CheckPermissions(permissions, Player.getGroup()) then
                  return true
               end
            end
         end
      elseif Config.Framework == 'newqb' then
         if source then
            for index, codem in pairs(permissions) do
               if frameworkObject.Functions.HasPermission(source, "god") or IsPlayerAceAllowed(source, 'command') then
                  return true
               end
            end
         end
      elseif Config.Framework == 'oldqb' then
         if source then
            if CheckPermissions(permissions, frameworkObject.Functions.GetPermission(source))then
               return true
            end
         end
      end
     return false
   end
end

function CheckPermissions(permissions, permission)
   for _,v in pairs(permissions) do

       if v == permission then
           return true
       end
   end
   return false
end