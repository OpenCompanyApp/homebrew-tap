class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.0/grok-0.3.0-macos-aarch64"
      sha256 "afa40d51640b97f27bc3fa9ddb4eca27e6249e4e7f363f0b0ead67fc42199190"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.0/grok-0.3.0-macos-x86_64"
      sha256 "70bf220a2c69d9f6829f584418de9c2142d2b4daf335c9cf021fb8b770d63b4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.0/grok-0.3.0-linux-aarch64"
      sha256 "a17f43b76f2a06a75cb42b473a5e99ba9ee26089b94a6b7c95d08abc56b19e06"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.0/grok-0.3.0-linux-x86_64"
      sha256 "4585864c9a42dc6a7fe88f9127df7eaafc2ce6fe0b6ab7d280d1f4f8234c5f07"
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
