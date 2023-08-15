local root_markers = { "pom.xml", ".git", "gradlew", "mvnw" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local home = os.getenv("HOME")
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local lombok = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "<leader>oi", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    vim.keymap.set("n", "crv", "<Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    vim.keymap.set("n", "crc", "<Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
    vim.keymap.set("n", "crm", "<Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    vim.keymap.set('n', 'gH', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-b>", ":lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gd', "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set('n', 'gh', "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set('n', '<space>ol', "<cmd>Lspsaga outline<CR>", opts)
    vim.keymap.set('n', '<space>fm', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local on_attach = function(client, bufnr)
  require("jdtls.setup").add_commands()
  --[[ require("jdtls").setup_dap({ hotcodereplace = "auto" }) ]]
  require("lsp-status").register_progress()
  --[[ require("jdtls.dap").setup_dap_main_class_configs() ]]
  require("compe").setup({
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
      path = true,
      buffer = true,
      calc = true,
      vsnip = false,
      nvim_lsp = true,
      nvim_lua = true,
      spell = true,
      tags = true,
      snippets_nvim = false,
      treesitter = true,
    },
  })

  vim.api.nvim_exec(
    [[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]],
    false
  )
end

local capabilities = {
  workspace = {
    configuration = true,
  },
  textDocument = {
    completion = {
      completionItem = {
        snippetSupport = true,
      },
    },
  },
}

local config = {
  flags = {
    allow_incremental_sync = true,
  },
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = root_dir,
}

config.settings = {
  java = {
    signatureHelp = { enabled = true },
    contentProvider = { preferred = "fernflower" },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
    },
    configuration = {
      runtimes = {
        {
          name = "JavaSE-17",
          path = "/usr/lib/jvm/java-17-openjdk/",
        },
        {
          name = "JavaSE-1.8",
          path = "/usr/lib/jvm/java-8-openjdk/",
        },
        {
          name = "JavaSE-11",
          path = "/usr/lib/jvm/java-11-openjdk/",
        },
      },
    },
  },
}
config.cmd = {
  "/usr/lib/jvm/java-17-openjdk/bin/java",
  "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  "-Dosgi.bundles.defaultStartLevel=4",
  "-Declipse.product=org.eclipse.jdt.ls.core.product",
  "-Dlog.protocol=true",
  "-Dlog.level=ALL",
  "-javaagent:" .. lombok,
  "-Xmx4g",
  "--add-modules=ALL-SYSTEM",
  "--add-opens",
  "java.base/java.util=ALL-UNNAMED",
  "--add-opens",
  "java.base/java.lang=ALL-UNNAMED",
  "-jar",
  vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
  "-configuration",
  vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_linux",
  "-data",
  workspace_folder,
}
config.on_attach = on_attach
config.on_init = function(client, _)
  client.notify("workspace/didChangeConfiguration", { settings = config.settings })
end

-- local jar_patterns = {
--     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
--     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
--     '/dev/microsoft/vscode-java-test/server/*.jar',
-- }

-- local bundles = {}
-- for _, jar_pattern in ipairs(jar_patterns) do
--   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
--     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
--       table.insert(bundles, bundle)
--     end
--   end
-- end
local bundles = {
  vim.fn.glob(
    vim.fn.stdpath("data") ..
    "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.44.0.jar",
    1
  ),
}
vim.list_extend(
  bundles,
  vim.split(vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/java-test/extension/server/*.jar", 1), "\n")
)
local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
config.init_options = {
  -- bundles = bundles;
  extendedClientCapabilities = extendedClientCapabilities,
  bundles = bundles,
}

-- UI
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
  local opts = {}
  pickers
      .new(opts, {
        prompt_title = prompt,
        finder = finders.new_table({
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = label_fn(entry),
              ordinal = label_fn(entry),
            }
          end,
        }),
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
          actions.goto_file_selection_edit:replace(function()
            local selection = actions.get_selected_entry(prompt_bufnr)
            actions.close(prompt_bufnr)

            cb(selection.value)
          end)

          return true
        end,
      })
      :find()
end

require("jdtls").start_or_attach(config)
