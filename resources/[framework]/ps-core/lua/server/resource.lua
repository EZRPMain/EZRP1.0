PSCore.Resource = {}

local warningPrintColor = "\x1b[33m"
local errorPrintColor = "\27[31m"
local colorBold = "\27[1m"
local resetPrintColor = "\x1b[0m"

-- Checks for updates for the specified resource or the invoking resource if not provided
function PSCore.Resource.CheckForUpdates(name)
    local resource = name or GetInvokingResource()
    local repository = GetResourceMetadata(resource, 'repository', 0)
    local version = GetResourceMetadata(resource, 'version', 0)

    -- If repository information is missing, print an error message and return
    if not repository then
        print("\27[31mCould not find repository information in fxmanifest.lua\27[0m")
        return
    end

    -- If version information is missing, print an error message and return
    if not version then
        print("\27[31mCould not find version information in fxmanifest.lua\27[0m")
        return
    end

    -- Retrieves the latest release version from GitHub for a given repository
    local function getLatestRelease(repository)
        local promise = promise:new()

        -- Send an HTTP request to GitHub API to fetch the latest release information
        PerformHttpRequest("https://api.github.com/repos/" .. repository .. "/releases/latest",
            function(statusCode, resultData)
                if statusCode == 200 then
                    local release = json.decode(resultData)
                    promise:resolve(release.tag_name) -- Resolve the promise with the latest release version
                else
                    error("Failed to fetch latest release for resource: " .. resource)
                end
            end, "GET", "", {
                ["Accept"] = "application/vnd.github.v3+json"
            })

        return promise
    end

    -- Coroutine to check for updates
    local function checkForUpdates()
        -- Use Citizen.Await to wait for the getLatestRelease coroutine to complete
        local latestRelease = Citizen.Await(getLatestRelease(repository))

        -- Compare the latest release version with the resource's version
        if latestRelease ~= version then
            -- Print a warning message indicating an available update
            print(string.format(warningPrintColor .. "An update is available for " .. resetPrintColor .. resource ..
                                    warningPrintColor .. " (Current version: " .. version .. " - Latest version: " ..
                                    latestRelease .. ")" .. resetPrintColor))
            -- Print the GitHub URL for the latest release
            print(string.format(warningPrintColor .. "Please visit https://github.com/" .. repository ..
                                    "/releases/tag/" .. latestRelease .. resetPrintColor))
        end
    end

    -- Call the checkForUpdates logic inside a coroutine using Citizen.CreateThread
    Citizen.CreateThread(function()
        checkForUpdates()
    end)
end

function PSCore.Resource.CheckResourceName(name)
    local resource = name or GetInvokingResource()
    local pattern = '-main'

    Citizen.CreateThread(function()
        Citizen.Wait(3000)
        if string.match(resource, pattern) then
            print(errorPrintColor .. "Remove \"" .. pattern .. "\" from the resource folder name: " .. resource)
        end
    end)
end

PSCore.Resource.CheckForUpdates('ps-core')
PSCore.Resource.CheckResourceName('ps-core')
