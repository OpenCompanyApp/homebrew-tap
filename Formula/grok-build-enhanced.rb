class GrokBuildEnhanced < Formula
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.4/grok-0.2.4-macos-aarch64"
      sha256 "ac78b46cd600ea36db624243b91988a45fdbbd4484a57bb51349b6ab942a368f"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.4/grok-0.2.4-macos-x86_64"
      sha256 "8ee38eacf437ff886653458f25f4b24601e55e8307aa8026b9dcc3c36a905b30"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.4/grok-0.2.4-linux-aarch64"
      sha256 "c171fdce1da43e974a4d0ed54a769498b816fe1a1ae1a616fefb0ecca3993ddc"
    end

    on_intel do
      url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v0.2.4/grok-0.2.4-linux-x86_64"
      sha256 "144c7c456dd44dcd8978172240f1c6620435e5e3da949c0af775e439cc6b399e"
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
