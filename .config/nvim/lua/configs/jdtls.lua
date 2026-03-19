local jdtls = require("jdtls")

local home = os.getenv("HOME")
local root_markers = {".git", "mvnw", "gradlew", "pom.xml", "build.gradle"}
local root_dir = require("jdtls.setup").find_root(root_markers)

local workspace_dir = home .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- debug bundles
local bundles = {
  vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
}

local config = {
  cmd = { "jdtls" },
  root_dir = root_dir,
  workspace_folder = workspace_dir,

  init_options = {
    bundles = bundles,
  },

  settings = {
    java = {},
  },
}

jdtls.start_or_attach(config)

