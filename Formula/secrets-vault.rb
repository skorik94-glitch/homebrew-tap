class SecretsVault < Formula
  desc "Local-first secrets + service-context copilot (MCP server + CLI)"
  homepage "https://github.com/skorik94-glitch/secrets-vault"
  url "https://github.com/skorik94-glitch/secrets-vault/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "6b6eec4790b27fd8c749041da5f8748d24edd498d53a090a1fc32a3db6745a8d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"secrets-vault").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/cli-main.mjs" "$@"
    SH
  end

  test do
    assert_match "secrets-vault", shell_output("#{bin}/secrets-vault --help")
  end
end
