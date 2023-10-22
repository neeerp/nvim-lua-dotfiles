local jdtls = require("jdtls")
local root_markers = { ".gradle", "gradlew", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls/workspace/" .. project_name

-- TODO: This guys a work in progress.
local config = {
	cmd = {
		--
		"/usr/lib/jvm/java-17-openjdk/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:/home/david/.local/lib/lombok/lombok.jar",
		--
		"-jar",
		"/home/david/.local/lib/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		"/home/david/.local/lib/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	settings = {
		java = {
			signatureHelp = { enabled = true },
			completion = {
				favoriteStaticMembers = {},
				filteredTypes = {
					-- "com.sun.*",
					-- "io.micrometer.shaded.*",
					-- "java.awt.*",
					-- "jdk.*",
					-- "sun.*",
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
				useBlocks = true,
			},
			import = { enabled = true },
			rename = { enabled = true },
		},
	},
	root_dir = root_dir,
	-- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

jdtls.start_or_attach(config)
