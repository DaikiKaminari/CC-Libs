local ObjectJSON = dofile("ObjectJSON.lua")

print("--- TEST decodeHTTPSave ---")
ObjectJSON.decodeHTTPSave("https://jsonplaceholder.typicode.com/todos/1", "test.json")

print("--- TEST decodeFromFile ---")
local obj = ObjectJSON.decodeFromFile("test.json")

print("--- TEST decode ---")
local obj2 = ObjectJSON.decode("{\"userId\": 1,\"id\": 1,\"title\": \"delectus aut autem\",\"completed\": false}")
for k,v in pairs(obj) do -- obj and obj2 should be identical (content)
    assert(v == obj2[k])
end

print("--- TEST encodeAndSavePretty ---")
obj["userId"] = 2
ObjectJSON.encodeAndSavePretty(obj, "test.json")
assert(ObjectJSON.decodeFromFile("test.json")["userId"] == 2)

print("\nAll tests of ObjectJSON.lua passed without error.")