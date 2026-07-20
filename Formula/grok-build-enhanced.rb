class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.5/grok-0.2.5-macos-aarch64"
      sha256 "da82dca35309d6eedf8c7dd6b32964e0c4cb68838e0fa371807fa8f466643913"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.5/grok-0.2.5-macos-x86_64"
      sha256 "baa7e7a2d0a8a2c749378319e4f480c00ee2f52fb8130cb49e6043ea3c4f6bb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.5/grok-0.2.5-linux-aarch64"
      sha256 "a976bd76eec4960c9103c24bd770512331f2696710bd8f89ba6d5468fb1eea17"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.5/grok-0.2.5-linux-x86_64"
      sha256 "471ee2ab6f675da195f989845474519d59522553f0829cb528c13fffac5e6c62"
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
