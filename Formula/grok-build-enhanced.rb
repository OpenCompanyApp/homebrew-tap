class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.5/grok-0.3.5-macos-aarch64"
      sha256 "2e8d70555e24979d189def280d1ae48a1150069704528ff4e6464e3c512a6f79"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.5/grok-0.3.5-macos-x86_64"
      sha256 "2ddfe3d82c4f10812835f4c00fe54dbf80dd85346f6b715b3e76ebbd02bd13eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.5/grok-0.3.5-linux-aarch64"
      sha256 "ed4aec6466782dcf4b1030ab606b42a86743fb0d0a90e120f747722fecedec79"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.5/grok-0.3.5-linux-x86_64"
      sha256 "6e7399d0feedf5222fef9503210d3404616ebba6933bde148bffce6fff32aa44"
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
