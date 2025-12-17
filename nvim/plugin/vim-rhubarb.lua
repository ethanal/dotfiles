local gh_url = os.getenv("GITHUB_ENTERPRISE_URL")
vim.g.github_enterprise_urls = gh_url and { gh_url } or {}
