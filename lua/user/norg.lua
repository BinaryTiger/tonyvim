local status_ok, norg = pcall(require, "neorg")

if not status_ok then
  return
end

norg.setup {
  load = {
    ["core.defaults"] = {},    -- Loads default behaviour
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
        folds = false,
      },
    },   -- Adds pretty icons to your documents
    ["core.integrations.telescope"] = {},
    ["core.dirman"] = {        -- Manages Neorg workspaces
      config = {
        workspaces = {
          main = "~/notes/main",
          personal = "~/notes/personal",
        },
        default_workspace = "main"
      },
    },
    ["core.summary"] = {},
    ["core.journal"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    }
  },
}
