cask "scrapeman" do
  version "0.4.2"

  on_arm do
    sha256 "b8048366b255fa9963e97219d8b278d2a0234524223e592f92ab2fe2d3cd526e"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "12665530e8fbc0655037206122616f94c3a2f61785359e398adcb48c6e80f91f"
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
