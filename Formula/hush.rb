class Hush < Formula
  desc "Local-first secrets + service-context copilot (MCP server + CLI)"
  homepage "https://github.com/skorik94-glitch/hush"
  url "https://github.com/skorik94-glitch/hush/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c96269c7a6bd8c0c374b59f598c0b4f53af47cdb7c13e5e26a5a2801e10b0cdb"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"hush").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/cli-main.mjs" "$@"
    SH
  end

  test do
    assert_match "hush", shell_output("#{bin}/hush --help")
  end
end
