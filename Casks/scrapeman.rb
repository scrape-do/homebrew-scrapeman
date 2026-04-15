cask "scrapeman" do
  version "0.2.1"

  on_arm do
    sha256 "d4c2a706f95c86aab502cfc54f90d539fa7689d1fcb51d077d2a0488d699047e"
    url "https://github.com/scrape-do/scrapeman/releases/download/v#{version}/Scrapeman-#{version}-arm64.dmg",
        verified: "github.com/scrape-do/scrapeman/"
  end

  on_intel do
    sha256 "a921ad62fe4410df165eba71cea96945bbdab44de1b2808dd2ca4eea28598806"
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

  zap trash: [
    "~/Library/Application Support/Scrapeman",
    "~/Library/Preferences/com.scrapeman.app.plist",
    "~/Library/Saved Application State/com.scrapeman.app.savedState",
    "~/Library/Logs/Scrapeman",
    "~/Library/Caches/Scrapeman",
    "~/Library/Caches/com.scrapeman.app",
  ]
end
