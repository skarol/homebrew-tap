class Duoctl < Formula
  desc "Fold, rotate and tap the iPhone Duo simulator from the command line"
  homepage "https://github.com/skarol/duoctl"
  url "https://github.com/skarol/duoctl/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d4e5f6b4f8f6c99d8fb1de06c494a1731319fc5e5f8cd9198bbcad423b1f5a4e"
  license "MIT"

  depends_on :macos

  def install
    libexec.install Dir["skills/duoctl/scripts/*"]
    bin.install_symlink libexec/"duoctl"
  end

  def caveats
    <<~EOS
      duoctl needs Xcode 27.1 or later with a booted iPhone Duo simulator.
      The first run compiles a small helper with Xcode's clang and caches it in ~/.cache/duoctl.
      --label, --id and `duoctl elements` also need AXe: brew install cameroncooke/axe/axe
    EOS
  end

  test do
    assert_equal "duoctl #{version}", shell_output("#{bin}/duoctl --version").strip
  end
end
