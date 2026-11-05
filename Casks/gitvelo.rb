cask "gitvelo" do
  version "0.7.0-beta.54"
  sha256 "b973e73b890e4d4ec15f02c52ca181d2eaf12d9ee36d8c9d4d4f6d58bd0f9d1c"
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
