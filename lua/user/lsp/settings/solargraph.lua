return {
	settings = {

    -- this is disabled since I'm using rvm instead of the assumed rbenv
    --cmd = { "solargraph", "stdio" },
    cmd = {"/Users/aracine/.rvm/gems/ruby-2.7.2/bin/solargraph", "stdio"},
    filetypes = { "ruby", "rakefile" },
    init_options = {
      formatting = true
    },
    root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
    settings = {
      solargraph = {
          autoformat = true,
          completion = true,
          diagnostic = true,
          references = true,
          rename = true,
          symbols = true
      }
    }
	},
}

