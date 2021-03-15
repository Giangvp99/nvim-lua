local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/usr/bin/omnisharp"
-- on Windows
-- local omnisharp_bin = "/path/to/omnisharp/OmniSharp.exe"
require'lspconfig'.omnisharp.setup{
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    filetypes={"cs"};
--   root_dir = root_pattern(".csproj", ".sln");
}

--require'lspconfig'.omnisharp.setup{
--  cmd={"omnisharp"};
--  filetypes={"cs"};
--  root_dir = root_pattern(".csproj", ".sln");
--}
