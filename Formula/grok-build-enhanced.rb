class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.12/grok-0.3.12-macos-aarch64"
      sha256 "46a1d697db0d485531148cad83baa5b8edc0a3f9421ff0d4e68dba9ff53d662a"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.12/grok-0.3.12-macos-x86_64"
      sha256 "5b471adeef1971b509f936ce882e366738aabaf20a20e17eb4bb216bb4045494"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.12/grok-0.3.12-linux-aarch64"
      sha256 "7a23da34e2a1a984dcaaa7983016f212ff381e082e9372dc43b24460e6113a52"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.12/grok-0.3.12-linux-x86_64"
      sha256 "8928e7de1a4bc5af36f2206c181da4901dac52deb899b4f67ff1e7f9e23423c4"
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
