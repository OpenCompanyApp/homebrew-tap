class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.17/grok-0.3.17-macos-aarch64"
      sha256 "bc949127cbd1f8d8d9f03344da9a0ff29063a0b3585faad1af7c608c6cf8f876"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.17/grok-0.3.17-macos-x86_64"
      sha256 "f63085aff406f2d624927f904122027cf860ac9a081fed9738bb77241aa1532e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.17/grok-0.3.17-linux-aarch64"
      sha256 "789414282b1b53b0113b6b7ab86aa7182ed88364050554a327ab0859e67d947e"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.3.17/grok-0.3.17-linux-x86_64"
      sha256 "5505cfe27d7bd13380f3475f315496e9d9d3e4c531a9e04156713b2f22f3214b"
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
