class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.16/grok-0.3.16-macos-aarch64"
      sha256 "cf08b9f817cbd39243fb91daaa80e895da807f10d4262ac58448127cb4a10c2a"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.16/grok-0.3.16-macos-x86_64"
      sha256 "303978f4eb94712908ab89cf273337fac655a41751f071b24f6d38ca7d932708"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.16/grok-0.3.16-linux-aarch64"
      sha256 "83c79b0115db8c034f3258ec86119290f01648c6c6fcd0bffe079bf84c275f2e"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.16/grok-0.3.16-linux-x86_64"
      sha256 "6a49eac61685366dff3237814c1d7bc640745cb92b830ca5913e4cbde3891e55"
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
