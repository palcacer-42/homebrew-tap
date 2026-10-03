cask "lid-awake" do
  version "2.2.0"
  sha256 "0c659d68ce6ea33ba14ad903a954ba3bf386fabd5e2ae00b791e6196d791fff8"

  url "https://github.com/palcacer-42/lid-awake/releases/download/v#{version}/Lid-Awake-v#{version}.zip"
  name "Lid Awake"
  desc "Keep a MacBook running with the lid closed, or blank the screen without sleeping"
  homepage "https://github.com/palcacer-42/lid-awake"

  app "Lid Awake.app"

  uninstall quit: "com.lidawake.app"

  caveats <<~EOS
    Lid Awake needs a one-time passwordless sudo rule so it can change the
    power-management setting without prompting for a password every time.
    Run this once:

      printf '%s\\n' "$(whoami) ALL=(root) NOPASSWD: /usr/bin/pmset -a disablesleep 0, /usr/bin/pmset -a disablesleep 1" \\
        | sudo tee /etc/sudoers.d/lid-toggle >/dev/null
      sudo chmod 440 /etc/sudoers.d/lid-toggle

    Then open "Lid Awake" and left-click the menu-bar cup icon to toggle it.
    (Right-click for the menu, including "Turn Screen Off".) The app will remind
    you if the rule is missing.

    The app is not notarized, so on first launch use right-click -> Open (or
    run: xattr -dr com.apple.quarantine "/Applications/Lid Awake.app").

    There is also a shell CLI in the source repo:
      https://github.com/palcacer-42/lid-awake
  EOS
end
