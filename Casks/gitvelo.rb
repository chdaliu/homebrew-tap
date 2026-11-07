cask "gitvelo" do
  version "0.7.0-beta.66"
  sha256 "fd88972d3020fa648b873e1612d4cf0b6adfd830d6f1f55faee7043ae4706141"
  # GitVelo updates itself on standalone macOS builds. Declaring this lets
  # Homebrew compare the installed app bundle instead of the Caskroom record,
  # so an in-app update is not reported as outdated.
  auto_updates true

  url "https://github.com/chdaliu/git-velo-app/releases/download/v#{version}/gitvelo-#{version}-macos-universal.dmg"
  name "GitVelo"
  desc "Cross-platform Git GUI client"
  homepage "https://github.com/chdaliu/git-velo"

  depends_on macos: :monterey

  app "gitvelo.app"
  binary "#{appdir}/gitvelo.app/Contents/MacOS/gitvelo", target: "gitvelo"

  # The community builds are ad-hoc signed. Removing the quarantine attribute
  # keeps the first launch from being blocked by Gatekeeper.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/gitvelo.app"], must_succeed: false
  end

  zap trash: "~/.config/gitvelo"
end
