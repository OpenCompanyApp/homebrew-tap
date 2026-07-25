class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.1/grok-0.3.1-macos-aarch64"
      sha256 "e87accd40b6f0bd2b73a3a45b992c069a6db9f146b687703e65f4f8ea07790ce"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.1/grok-0.3.1-macos-x86_64"
      sha256 "05473a3f25ea9a1fabaf53c807264877e6fd3b9fe0ca2c7b482cdc5d9ce7c7ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.1/grok-0.3.1-linux-aarch64"
      sha256 "b48d53ab42142720062d2b1265c924b4024712a0f70cfcf17640ad9e1832f42d"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.1/grok-0.3.1-linux-x86_64"
      sha256 "957389dfa9c206473360acb01f1092ccb2a3d0f55baac54d9df5e826e627a2a5"
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
