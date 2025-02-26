-- This is used later as the default terminal and editor to run.
local apps = {}
apps.terminal   = 'wezterm'
apps.editor     = os.getenv('EDITOR') or 'nvim'
apps.editor_cmd = apps.terminal .. ' -e ' .. apps.editor
apps.browser    = 'thorium'
apps.file_manager = 'thunar'
apps.music_player = 'spotify'

-- Set the terminal for the menubar.
require('menubar').utils.terminal = apps.terminal

return apps
