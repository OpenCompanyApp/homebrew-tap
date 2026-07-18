cask "grok-build-enhanced" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.2.1"
  sha256 arm:   "e0c14024ba9b3a214b82d089fa74b872a217b537974ba23f8e83454a398a0934",
         intel: "526fb15b04724766a37b7976cc656d2688ad68e3d7901bb4b3a027ec9ed82f3a"

  url "https://github.com/OpenCompanyApp/grok-build-enhanced/releases/download/v#{version}/grok-#{version}-macos-#{arch}"
  name "Grok Build Enhanced"
  desc "Terminal AI coding assistant maintained as an unofficial Grok Build fork"
  homepage "https://github.com/OpenCompanyApp/grok-build-enhanced"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  container type: :naked

  binary "grok-#{version}-macos-#{arch}", target: "grok"
  binary "grok-#{version}-macos-#{arch}", target: "agent"

  generate_completions_from_executable "grok-#{version}-macos-#{arch}",
                                       "completions",
                                       base_name: "grok"
end
