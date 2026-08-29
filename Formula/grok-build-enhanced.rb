class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.15/grok-0.3.15-macos-aarch64"
      sha256 "ddc851e4189053596f59a197706c325aeacb9417dfbc78616528f07252156486"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.15/grok-0.3.15-macos-x86_64"
      sha256 "8942eef3e06c8028f46ac74914dbf0e3e72bf757f31d7e049f99ff87720652c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.15/grok-0.3.15-linux-aarch64"
      sha256 "af2495e6d1b9479c796a2ffab5750aaea0cfcedf4354dee9b511c628d95f4c98"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.15/grok-0.3.15-linux-x86_64"
      sha256 "af287ee2ba3d6aaf1b3a5c9389b0c1491e97f13fb3cb52920f534b07e8347327"
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
