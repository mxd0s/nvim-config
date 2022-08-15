local present, neorg = pcall(require, "neorg")

if not present then
  return
end

local icons = require "custom.plugins.icons"

local options = {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        autochdir = false,
        autochdetect = true,
        workspaces = {
          work = "~/notes/work",
        },
      },
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      }
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "work",
      }
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.norg.concealer"] = {
      config = {
        markup_presest = "brave",
        icons = {
          todo = icons.todo,
          list = icons.list,
          heading = icons.heading,
        },
      },
    },
  },
}

neorg.setup(options)
