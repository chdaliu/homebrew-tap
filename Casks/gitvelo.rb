cask "gitvelo" do
  version "0.7.0-beta.15"
  sha256 "e699daf2d1f66857e31f6dbe609f714d46cf251c1aefba48f9f5a9a02a18e5b7"

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
