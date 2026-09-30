cask "lid-awake" do
  version "1.0.0"
  sha256 "15ebf085bd0ef4e71ce95684699c0b67894485bdd2495c1e03f2fd0f2490a13e"

  url "https://github.com/palcacer-42/lid-awake/releases/download/v#{version}/Lid-Awake-v#{version}.zip"
  name "Lid Awake"
  desc "Keep a MacBook running with the lid closed (no external display needed)"
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

    Then open "Lid Awake" and flip the toggle. The app will remind you if the
    rule is missing.

    The app is not notarized, so on first launch use right-click -> Open (or
    run: xattr -dr com.apple.quarantine "/Applications/Lid Awake.app").

    There is also a shell CLI in the source repo:
      https://github.com/palcacer-42/lid-awake
  EOS
end
