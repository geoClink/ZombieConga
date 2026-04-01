# ZombieConga

ZombieConga is a small, fun iOS game built with SpriteKit where a dancing zombie collects cats while avoiding enemies. The game showcases simple touch controls, sprite animation, sound effects, and a small progression mechanic where the zombie builds a "train" of cats; survive long enough and collect enough cats to win. This repository contains the complete Xcode project, assets, and sounds required to build and run the game locally.

---

## Features

- Smooth sprite-based animation for the main zombie character.
- Touch controls to guide the zombie around the scene.
- Randomly spawning cats and enemies with animated behaviors.
- Audio: background music plus collision and event sound effects.
- Win / lose conditions and a simple Game Over scene.
- Project organized for quick inspection and small modifications.

---

## Screenshots

Below is the current gameplay screenshot (uploaded) followed by instructions for capturing and adding your own screenshots.

<!-- Display uploaded screenshot if present on GitHub -->
<img width="800" alt="Gameplay screenshot" src="https://github.com/user-attachments/assets/41440e00-897e-41e1-9874-20476a1709f7" />


Below is a placeholder for a gameplay screenshot (if you prefer to include the image in the repo). To add your own screenshot, follow the "Capture & add a screenshot" steps after this snippet and place the image at `Docs/screenshots/gameplay.png` (or update the path in the markdown below if you prefer another location).

![Gameplay screenshot](Docs/screenshots/gameplay.png)

Capture & add a screenshot

1. Run the game in the Simulator or on a device.
   - Open the project and press Run (⌘R) in Xcode. Choose a Simulator (e.g., iPhone 14) or a connected device.
2. Capture the screenshot:
   - From the Simulator app: Menu → File → Save Screen Shot... (saves to ~/Pictures by default).
   - Or from the command line (Simulator):

```bash
# Saves a screenshot of the currently booted simulator
xcrun simctl io booted screenshot ~/Desktop/zombie_conga_simulator.png
```

   - On a physical device: press the device's screenshot buttons (or use Xcode's Devices and Simulators window to capture a screenshot).
3. (Optional) Resize/optimize the image to be web-friendly (max width ~1200px and use PNG or JPG).
4. Add the screenshot to the repository in a new folder `Docs/screenshots/`:

```bash
mkdir -p Docs/screenshots
# move or copy your screenshot into the folder, e.g.:
mv ~/Desktop/zombie_conga_simulator.png Docs/screenshots/gameplay.png
```

5. Commit and push to GitHub:

```bash
git add Docs/screenshots/gameplay.png
git commit -m "Add gameplay screenshot"
git push origin main
```

6. Refresh the GitHub repository page and the README will display the screenshot.

Notes and tips

- Filenames and paths are case-sensitive on some systems; use consistent lowercase paths to avoid confusion.
- If you prefer to keep images out of the main repo, you can upload the screenshot to an image host (or GitHub Issues) and use the hosted URL in the README instead.

---

## Getting started

Recommended environment:

- Xcode: Use the version you have available; for best compatibility use Xcode 14 or newer.
- Swift: 5.x (project file uses a Swift toolchain compatible with Swift 5).
- iOS Deployment Target: Check the project target in Xcode if you need to run on an older iOS version.
- Package managers: There are no external dependencies (no CocoaPods / SwiftPM / Carthage files present). Everything required is included in the repo.

Open and run the project (from the project root):

```bash
cd /path/to/ZombieConga
open ZombieConga.xcodeproj
# or, if a workspace is present:
# open ZombieConga.xcworkspace
```

In Xcode: select the `ZombieConga` scheme, pick a Simulator (for example, iPhone 14), then press Run (⌘R).

Notes:

- If Xcode prompts to "Update to recommended settings", review and apply them if you want to modernize project settings.
- If you encounter code signing errors when building on a physical device, go to the project target's Signing & Capabilities and set your Development Team or use automatic signing. Simulator builds normally don't require signing.

---

## How to play

Controls:

- Tap or drag anywhere on the screen to direct the zombie toward that point. The zombie moves toward the latest touch location. Collect cats by moving the zombie over them to add them to your "train". Avoid enemies; colliding with an enemy removes lives. If the train reaches 5 cats you win. If you lose all lives you lose.

Gameplay mechanics:

- The zombie continuously animates and moves toward the most recent touch location. Cats spawn periodically at random locations and will join the zombie's train when touched. Enemies move across the screen horizontally; colliding with an enemy costs a life and may cause some of your collected cats to scatter and disappear. Starting lives: 5. Win condition: `trainCount >= 5`. Lose condition: `lives <= 0`.

Sound and feedback:

- Background music plays during the game. Collecting cats triggers `hitCat.wav`, hitting an enemy triggers `hitCatLady.wav`. Win and lose scenes play `win.wav` and `lose.wav` respectively.

---

## Project structure

- `Shared/` — Core game scenes and shared code:
  - `GameScene.swift` — Main gameplay logic (spawn, collisions, movement, win/lose checks).
  - `GameOverScene.swift` — Win/lose scene and presentation logic.
  - `MainMenuScene.swift` — Main menu scene.
  - `MyUtils.swift` — Utility functions and helpers used across scenes.

- `Game.xcassets/` — Asset catalog for images and app icon. Contains backgrounds, zombies, cat, enemy, and win/lose images.

- `Sounds/` — Audio assets: `backgroundMusic.mp3`, `hitCat.wav`, `hitCatLady.wav`, `lose.wav`, `win.wav`.

- `ZombieConga/` — App project files (AppDelegate, GameViewController, storyboards).

- `ZombieConga.xcodeproj/` — Xcode project workspace and configuration.

Important files to inspect when modifying gameplay:

- `Shared/GameScene.swift` — movement, spawning, collision detection, lives and win logic.
- `Shared/MyUtils.swift` — contains helper functions referenced by the scene code.
- `Game.xcassets/` and `Sounds/` — replace assets here if customizing visuals or audio.

---

## Assets and licensing

All code in this repository is provided under the LICENSE file in the project root. Image and sound assets included under `Game.xcassets/` and `Sounds/` are either original, provided by the project author, or have separate licensing terms. If you reuse or redistribute assets, verify and comply with the original asset licenses and provide attribution as required.

If you used third-party assets, please add attributions and license files (for example in an `ASSETS_LICENSES.md`).

---

## Troubleshooting and common issues

- Missing assets or wrong asset names: If the app crashes or displays empty sprites, verify that `Game.xcassets` contains the named image sets (`zombie1`, `zombie2`, `zombie3`, `zombie4`, `cat`, `enemy`, `background1`) and that `Sounds/` contains the expected filenames. Filenames are case-sensitive on some filesystems.

- Code signing / provisioning: If you see code signing errors when building on a physical device, open the project in Xcode, select the `ZombieConga` target, go to Signing & Capabilities, and set your Development Team or switch to automatic signing. For Simulator runs, choose a Simulator target.

- Swift/Xcode version errors: If Xcode shows Swift compiler errors due to language features or API availability, try opening the project with a current Xcode version and apply recommended project setting updates. Update `SWIFT_VERSION` in the project build settings if needed.

- Audio playback not working: Check the `playBackgroundMusic(filename:)` helper in `Shared/MyUtils.swift` and confirm that the audio files exist and are included in the target bundle.

---

## Contributing

Contributions welcome. To contribute changes:

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature/my-change`.
3. Make your changes and commit with descriptive messages.
4. Open a pull request describing your changes and why they are needed.

Before opening a PR, ensure the app builds and runs in the Simulator, and include any screenshots or recordings for UI changes. For larger changes (new assets, mechanics), open an issue first to discuss the design.

---

## Credits and license

Author: George Clinkscales

This project includes image and sound assets bundled in `Game.xcassets/` and `Sounds/`. If you are using any of these assets beyond the scope of this project, verify ownership and licensing.

License: MIT (see `LICENSE`)

<!-- Added acknowledgement -->

Acknowledgement:

I followed a SpriteKit tutorial to learn and practice while building this project: [YouTube tutorial playlist](https://www.youtube.com/watch?v=wrEEIX2fUxE&list=PL23Revp-82LIKiBNSJaF311ixNvSzk8LC).
