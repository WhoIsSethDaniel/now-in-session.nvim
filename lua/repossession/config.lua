local Path = require 'plenary.path'

local config = {}

local defaults = {
  auto = false,
  session_dir = Path:new(vim.fn.stdpath 'data', 'sessions'):absolute(),
  whitelist_dirs = {},
  blacklist_dirs = {},
  ignore_ft = {},
  ignore_bt = {},
  hooks = {},
}

function config.setup(conf)
  defaults = vim.tbl_deep_extend('force', defaults, conf or {})
  if type(defaults.session_dir) == 'string' then
    defaults.session_dir = Path:new(defaults.session_dir)
  end
  vim.validate {
    auto = { defaults.auto, 'b' },
    session_dir = { defaults.session_dir, 't' },
    whitelist_dirs = { defaults.whitelist_dirs, 't' },
    blacklist_dirs = { defaults.blacklist_dirs, 't' },
    ignore_ft = { defaults.ignore_ft, 't' },
    ignore_bt = { defaults.ignore_bt, 't' },
    hooks = { defaults.hooks, 't' },
  }
  setmetatable(config, { __index = defaults })
end

setmetatable(config, { __index = defaults })

return config
