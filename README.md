# Yui for Omarchy

Meet Yui, a generative user interface. Your agent draws the screen instead of replying in walls of text: a timer, a form, a quick choice. You chat like normal, and when a button or a timer would work better than text, the agent puts one on the screen. Your taps go straight back to it.

This repo is Yui on **Omarchy (Arch and Hyprland)**. It is new and mostly empty on purpose: it is the place to push when you build it, you or your agent.

**Start here: [YUI-177](https://www.yuigui.com/contribute#YUI-177)**, the first pull request for this repo, open on the backlog.

## What goes here

Rust and ratatui, in the terminal. Colors come from the current Omarchy theme, it opens from a Hyprland binding, Walker finds it, and it runs in any other terminal too.

The hub already has a Rust Yui Lines parser that passes the vectors: [`parsers/rust`](https://github.com/postscarcityai/yuigui/tree/main/parsers/rust). Start from it.

## The contract

Every Yui, on every platform, keeps the same few promises. That is what makes it one app:

1. **It speaks Yui Lines.** The agent sends one short line per screen, like `timer 40/20x8 Tabata`. The grammar is [spec/YL.md](https://github.com/postscarcityai/yuigui/blob/main/spec/YL.md), and your parser passes the shared [conformance vectors](https://github.com/postscarcityai/yuigui/tree/main/spec/conformance).
2. **A tap sends the same line everywhere.** The event a tap makes here is byte for byte the line the iPhone and the [playground](https://www.yuigui.com/playground) send. An agent cannot tell which device you used.
3. **Nothing breaks.** A preset this device cannot draw shows "Open on your phone" instead.
4. **No brain of its own.** Yui brings no model. Agents talk through the relay ([spec/RELAY.md](https://github.com/postscarcityai/yuigui/blob/main/spec/RELAY.md)), and every client reads the same threads.
5. **No keys in the code.** You never need ours, and we never ask for yours.

## The vectors

`conformance/` holds a copy of the hub's Yui Lines conformance vectors (`spec/conformance/*.json` in [yuigui](https://github.com/postscarcityai/yuigui/tree/main/spec/conformance)). Your parser must pass them. `scripts/sync-vectors.sh` refreshes the copy from a hub checkout, or from GitHub when there is none. Never edit the copies by hand; vectors change in the hub.

## Run it

Rust stable. Omarchy is nice to have, not needed: off Omarchy it uses your terminal's colors.

```sh
cargo test
cargo clippy -- -D warnings
cargo build --release
```

## Every Yui

| Platform | Repo | Built with |
| --- | --- | --- |
| iPhone and iPad | [yui](https://github.com/postscarcityai/yui) | SwiftUI. The app on TestFlight today, the Hermes plugin, the backend |
| Mac | [yui-macos](https://github.com/postscarcityai/yui-macos) | SwiftUI for macOS, native |
| Apple Watch | [yui-watch](https://github.com/postscarcityai/yui-watch) | SwiftUI for watchOS |
| Apple Vision Pro | [yui-visionos](https://github.com/postscarcityai/yui-visionos) | SwiftUI for visionOS |
| Apple TV | [yui-tvos](https://github.com/postscarcityai/yui-tvos) | SwiftUI for tvOS |
| Android phones and tablets | [yui-android](https://github.com/postscarcityai/yui-android) | Kotlin and Jetpack Compose |
| Wear OS | [yui-wearos](https://github.com/postscarcityai/yui-wearos) | Kotlin and Compose for Wear OS |
| Windows and Linux | [yui-desktop](https://github.com/postscarcityai/yui-desktop) | Tauri 2 and the web renderer |
| Omarchy | **yui-omarchy** (this repo) | Rust in the terminal, in your Omarchy theme |
| Browser | [yui-web](https://github.com/postscarcityai/yui-web) | The web renderer, live on the relay |
| Spec, parsers, site | [yuigui](https://github.com/postscarcityai/yuigui) | Yui Lines, the conformance vectors, yuigui.com |

The board with every card: [yuigui.com/board](https://www.yuigui.com/board). The roadmap: [yuigui.com/roadmap](https://www.yuigui.com/roadmap).

## Contributing

Humans and agents are both welcome. Agents, read [AGENTS.md](AGENTS.md) and [CONTRIBUTING-AGENTS.md](CONTRIBUTING-AGENTS.md) first. People: [yuigui.com/contribute](https://www.yuigui.com/contribute). Want this platform to do something no card covers? Write a short spec in the hub: copy [docs/specs/TEMPLATE.md](https://github.com/postscarcityai/yuigui/blob/main/docs/specs/TEMPLATE.md) there and open a pull request.

## License

[Apache-2.0](LICENSE). Copyright 2026 PostScarcity AI.
