cask "scrapeman" do
  version "0.2.2"

  on_arm do
    sha256 "02623d5d06822f32c9578fd5c3b577e5d41601f2cd85449963dd65346e5e1147"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "0c2b53dbfd9778c6719d331dcd5639d8809a4be4c6b7d9b55c48aaa595e67c56"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-x64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  name "Scrapeman"
  desc "Open-source desktop API client built by Scrape.do"
  homepage "https://scrapeman.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Scrapeman.app"

  # Strip the quarantine xattr that Homebrew sets on every cask install
  # since it dropped --no-quarantine. Scrapeman is ad-hoc signed (Apple
  # Developer ID notarization is on the long-term roadmap) so without
  # this the user would see a Gatekeeper warning on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Scrapeman.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Scrapeman",
    "~/Library/Preferences/com.scrapeman.app.plist",
    "~/Library/Saved Application State/com.scrapeman.app.savedState",
    "~/Library/Logs/Scrapeman",
    "~/Library/Caches/Scrapeman",
    "~/Library/Caches/com.scrapeman.app",
  ]
end
