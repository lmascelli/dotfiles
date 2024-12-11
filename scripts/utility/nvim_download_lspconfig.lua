local luv = require('luv')

-- URL for the GitHub repository's ZIP file
local url = "https://github.com/neovim/lsp-config/archive/refs/heads/master.zip"
local host, path = url:match("https?://([^/]+)(/.*)")
local filename = "lsp-config-main.zip"

-- Parse host and path from URL
local port = 80  -- Standard HTTP port
local request = "GET " .. path .. " HTTP/1.1\r\n" ..
               "Host: " .. host .. "\r\n" ..
               "Connection: close\r\n\r\n"

-- Resolve the host to an IP address
local function resolve_and_download()
    luv.getaddrinfo(host, nil, nil, function(err, addrinfo)
        if err then
            print("DNS resolution failed:", err)
            return
        end

        local ip_address = addrinfo[1].addr
        print("Resolved IP:", ip_address)

        -- Create a TCP connection to GitHub IP address
        local tcp = luv.new_tcp()
        tcp:connect(ip_address, port, function(err)
            if err then
                print("Failed to connect:", err)
                return
            end

            -- Send the HTTP request
            tcp:write(request)

            -- Open the file to save the downloaded ZIP data
            local file = io.open(filename, "wb")
            if not file then
                print("Failed to open file for writing.")
                return
            end

            -- Read the response in chunks and write to file
            local function read_response()
                tcp:read_start(function(err, chunk)
                    if err then
                        print("Error reading response:", err)
                        file:close()
                        return
                    end
                    if chunk then
                        file:write(chunk)
                    else
                        -- End of response, close the file and the connection
                        file:close()
                        tcp:close()
                        print("Download complete!")
                    end
                end)
            end

            -- Start reading the response
            read_response()
        end)
    end)
end

-- Call the function to start downloading
resolve_and_download()

-- Run the event loop
luv.run()
