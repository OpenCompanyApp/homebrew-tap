class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.11/grok-0.3.11-macos-aarch64"
      sha256 "9bf3557b3feb00af316a63612ea6d1674160884497a5a877cba6a74063f51f1b"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.11/grok-0.3.11-macos-x86_64"
      sha256 "2360f01988677bce9a32bfbec511ba5472907ad0c4123252108d483f9916d362"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.11/grok-0.3.11-linux-aarch64"
      sha256 "d585129f80c39cfa083ef1a27a1c754f1b9fa6dbd8e1904632617857c7d26e0b"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.11/grok-0.3.11-linux-x86_64"
      sha256 "34ad7b8928dc9cdb30365123cc20c08f61a603a8af8935748eb68ddbed2496ed"
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
