local currentVersion = 'v1.0.0'

local function fetchLatestVersion(callback)
    PerformHttpRequest('https://api.github.com/repos/RealisticScripts/rs-ai-controller/releases/latest', function(statusCode, response)
        if statusCode == 200 then
            local data = json.decode(response)
            if data and data.tag_name then
                callback(data.tag_name)
            else
                print('[rs-ai-controller] Failed to fetch the latest version')
            end
        else
            print(('[rs-ai-controller] HTTP request failed with status code: %s'):format(statusCode))
        end
    end, 'GET')
end

local function checkForUpdates()
    fetchLatestVersion(function(latestVersion)
        if currentVersion ~= latestVersion then
            print('[rs-ai-controller] A new version of the script is available!')
            print(('[rs-ai-controller] Current version: %s'):format(currentVersion))
            print(('[rs-ai-controller] Latest version: %s'):format(latestVersion))
            print('[rs-ai-controller] Please update the script from: https://github.com/RealisticScripts/rs-ai-controller')
        else
            print('[rs-ai-controller] Your script is up to date!')
        end
    end)
end

checkForUpdates()
