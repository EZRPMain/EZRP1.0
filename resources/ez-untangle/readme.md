<!-- Example how to use the export. -->

RegisterCommand('tanglehackhard', function()
  exports['ez-untangle']:OpenUntangleGame(function(action)
    print(action)
    if action == 'failed' then
      print('GAME FAILED')
    else
      print('GAME SUCCESS')
    end
  end, HOW MANY CIRCLES U WANT)
end)

if you change the UI make sure to open the terminal and do the following.

[1] - cd web
[2] - npm i --force
[3] - npm run build