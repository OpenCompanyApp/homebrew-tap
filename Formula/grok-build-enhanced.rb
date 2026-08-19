class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.10/grok-0.3.10-macos-aarch64"
      sha256 "a3a17a4345e96de01f99f4c12842197a24d8dd99c3da061c16f7664c9b9e8533"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.10/grok-0.3.10-macos-x86_64"
      sha256 "6c27df9cfbe6b2496787979aacb61ae6f2c2ce2d1a25a9b29fe12c9366eb7f1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.10/grok-0.3.10-linux-aarch64"
      sha256 "9cc2ad4ee2d8ed71326733c372a21ec355891c4a49806f52af3a5ac4679dbf4a"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.10/grok-0.3.10-linux-x86_64"
      sha256 "ff26c8529a9e46c2b7406118cf855d9c7bd94e9e4252b8e6a40f79257d53f23b"
    end
  end

  def install
    os = OS.mac? ? "macos" : "linux"
    arch = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    asset = "grok-#{version}-#{os}-#{arch}"
    bin.install asset => "grok"
    chmod 0755, bin/"grok"
    bin.install_symlink "grok" => "agent"
  end

  test do
    assert_match "Grok Build Enhanced #{version}", shell_output("#{bin}/grok version")
  end
end
