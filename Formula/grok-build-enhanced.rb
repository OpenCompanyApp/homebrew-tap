class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.9/grok-0.3.9-macos-aarch64"
      sha256 "d8ba4e8495203fac0267a1cdc7ee54b883cfcfd99b822d3701eecc5295de74f9"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.9/grok-0.3.9-macos-x86_64"
      sha256 "b555877fc4fced7eb71d391485b0af0f328235e02902d6762a98cd0348c9b76e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.9/grok-0.3.9-linux-aarch64"
      sha256 "c44749d74ebb20177420c7a82c27886a39f696db0ab22022e342b43b697fa4c2"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.9/grok-0.3.9-linux-x86_64"
      sha256 "8e2a69069e692d0e60104f6a42b4c4e9cc7e034228513486f39dcf7d3397fd95"
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
