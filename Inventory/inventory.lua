-- [V1.1]
local inventory = {}

-- return true if two items are identical
local function isItemIdentical(item1, item2, ignoreQty)
    if not item1 then
        error("First item cannot be nil.")
    end
    if not item2 then
        error("Second item cannot be nil")
    end
    return compareItems(item1, item2, ignoreQty) and compareItems(item2, item1, ignoreQty)
end
inventory.isItemIdentical = isItemIdentical

local function compareItems(item1, item2, ignoreQty)
    for k,v in pairs(item1) do
        if type(v) ~= type(item2[k]) then
            return false
        end
        if type(v) == "table" then
          if not compareItems(v, item2[k], ignoreQty) then
            return false
          end
        else
          if (not ignoreQty and v ~= item2[k]) or (k ~= "qty" and v ~= item2[k]) then
            return false
          end
        end
    end
    return true
end
inventory.compareItems = compareItems

local function isItemInList(item1, itemList, ignoreQty)
    for k,item2 in pairs(itemList) do
        if isItemIdentical(item1, item2, ignoreQty) then
            return k
        end
    end
    return false
end
inventory.isItemInList = isItemInList

local function isItemListIdentical(items1, items2, ignoreQty)
    for _,item1 in pairs(items1) do
        if not isItemInList(item1, items2, ignoreQty) then
            return false
        end
    end
    for _,item2 in pairs(items2) do
        if not isItemInList(item2, items1, ignoreQty) then
            return false
        end
    end
    return true
end
inventory.isItemListIdentical = isItemListIdentical

return inventory