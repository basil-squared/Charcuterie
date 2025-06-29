SMODS.current_mod.optional_features = {
  cardareas = {
    unscored = true,
    retrigger_joker = true,
  },
}
function async_exec(command)
  os.execute ('start /B "" ' .. command)
end
CHAR = {}
CHAR.FUNC = {}
CHAR.G = {}
CHAR.G.Overclock_Table = {}
CHAR.G.current_bunker_suit = 'Spades'
function convert_to_windows_path(path)
    return path:gsub("/", "\\")
end

CHAR.G.MODPATH = SMODS.current_mod.path
CHAR.G.WINPATH = convert_to_windows_path(CHAR.G.MODPATH)
CHAR.G.lyrics = {curr_lyric = "test"}
SMODS.Atlas {
  key = "modicon",
  path = "modicon.png",
  px = 34,
  py = 34
}
local NFS = require("nativefs")

function CHAR.FUNC.RequireFolder(path)
  local files = NFS.getDirectoryItemsInfo(CHAR.G.MODPATH .. "/" .. path)
  for i = 1, #files do
    local file_name = files[i].name
    if file_name:sub(-4) == ".lua" then
      assert(SMODS.load_file(path .. file_name))()
      print("Loaded " .. path .. file_name)
    end
  end
end

function CHAR.FUNC.RequireFolderRecursive(path)
  local function scan(currentPath)
    local fullPath = CHAR.G.MODPATH .. "/" .. currentPath
    local files = NFS.getDirectoryItemsInfo(fullPath)

    for _, fileInfo in ipairs(files) do
      local fileName = fileInfo.name
      local fileType = fileInfo.type
      local childPath = currentPath == "" and fileName or currentPath .. "/" .. fileName

      if fileType == "directory" then
        -- Recursively scan subdirectories
        scan(childPath)
      elseif fileType == "file" and fileName:sub(-4) == ".lua" then
        -- Load the Lua file with proper relative path
        assert(SMODS.load_file(childPath))()
        print("Loaded " .. childPath)
      end
    end
  end

  scan(path) -- Start scanning from initial path
end

CHAR.FUNC.RequireFolderRecursive("modules/init/")
CHAR.FUNC.RequireFolderRecursive("modules/content")
if next(SMODS.find_mod("partner")) then
  CHAR.FUNC.RequireFolder("modules/crossmod/partners/")
end
if JokerDisplay then
  jd_def = JokerDisplay.Definitions
  CHAR.FUNC.RequireFolderRecursive("modules/crossmod/funcs/JokerDisplay")
end