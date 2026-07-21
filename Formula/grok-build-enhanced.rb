class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.2.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.6/grok-0.2.6-macos-aarch64"
      sha256 "1855f549164e5d704d57e1a422ee0ee9120dd3261da85a84156ea70dc1e9d90a"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.6/grok-0.2.6-macos-x86_64"
      sha256 "52522ed3d4688369a1d11f2c5af991adea4b9fcea0596de0abf3bc4425dfb89d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.6/grok-0.2.6-linux-aarch64"
      sha256 "22fb1e4ac195d984ae560dbfd976a7fc2e96539c422e693e08aff8eadd510645"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.6/grok-0.2.6-linux-x86_64"
      sha256 "5c59dcd8978a3e5b5a1a0dadebccd9497caa583f546ff49d301c6226fa7115f4"
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
