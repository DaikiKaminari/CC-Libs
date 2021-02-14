-- [V2.0]
local ObjectJSON = {}

--- INIT ---
local function init()
	print("\n--- INIT ObjectJSON ---")
	if not fs.exists("./json") then
		print("Warning : File not found : [json]")
		print("Trying to download [json] lib.")
		local obj = http.get("https://pastebin.com/raw/4nRg9CHU")
		assert(obj, "Download failed.")
		local str = obj.readAll()
		assert(str and str ~= "", "Download failed.")
		local h = fs.open("json", "w")
		h.write(str)
		h.close()
		print("Download successful.")
	end
	os.loadAPI("json")
	print("API [json] loaded")
end

--- FUNCTIONS ---
-- returns json object with the list of players
local function ObjectJSON.listConnectedPlayers()
	local obj = http.get("http://api.mineaurion.com/v1/serveurs")
	if obj == nil then
		print("Warning : HTTP request on [http://api.mineaurion.com/v1/serveurs] failed.")
		return nil
	end
	local str = obj.readAll()
	local arrObj = json.decode(str) -- array of json object containing each server
	return arrObj
end

-- convert text (in json format) into a JSON object (table) and returns it
local function ObjectJSON.decode(text)
	assert(text, "text cannot be nil.")
	return json.decode(text)
end

-- get the content of a file and returns a JSON object (table)
local function ObjectJSON.decodeFromFile(filename)
	assert(filename, "filename cannot be nil.")
	assert(fs.exists(filename), "[" .. filename .. "] not found.")
	return json.decodeFromFile(filename)
end

-- get the content of a HTTP link and returns a JSON object (table)
local function ObjectJSON.decodeHTTP(link)
	assert(link, "link cannot be nil.")
	local request = http.get(link)
	if request == nil then
		print("Warning : HTTP request on [" .. link .. "] failed.")
		return nil
	end
	return json.decode(request.readAll())
end

-- get the content of a HTTP link and save it to a file
local function ObjectJSON.decodeHTTPSave(link, filename)
	assert(link, "link cannot be nil.")
	assert(filename, "filename cannot be nil.")
	local request = http.get(link)
	if request == nil then
		print("Warning : HTTP request on [" .. link .. "] failed.")
		return nil
	end
	local h = fs.open(filename, "w")
	h.write(encodePretty(decode(request.readAll())))
	h.close()
end

-- convert JSON object (table) into a string
local function ObjectJSON.encode(obj)
	assert(obj, "obj cannot be nil.")
	return json.encore(obj)
end

-- convert JSON object (table) into a string (pretty json)
local function ObjectJSON.encodePretty(obj)
	assert(obj, "obj cannot be nil.")
	return json.encore(obj)
end

-- save a table to a JSON file
local function ObjectJSON.encodeAndSavePretty(filename, obj)
	assert(filename, "filename cannot be nil.")
	assert(obj, "obj cannot be nil.")
	if not fs.exists(filename) then
		print("Creating file [" .. filename .. "]")
	end
	local h = fs.open(filename, "w")
	h.write(json.encodePretty(obj))
	h.close()
end

init()
return ObjectJSON