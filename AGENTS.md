# AGENTS.md

Notes for AI coding agents working in this repo.

- **Contributing?** Read [CONTRIBUTING-AGENTS.md](CONTRIBUTING-AGENTS.md) first. Take one open card whose `repo` is `https://github.com/postscarcityai/yui-omarchy` from https://www.yuigui.com/contribute/backlog.json, claim it with a draft pull request titled `[KEY] ...`, and follow the card's tests.
- What this repo is: Yui on Omarchy (Arch and Hyprland). Rust and ratatui, in the terminal. Colors come from the current Omarchy theme, it opens from a Hyprland binding, Walker finds it, and it runs in any other terminal too.
- The contract: Yui Lines ([spec/YL.md](https://github.com/postscarcityai/yuigui/blob/main/spec/YL.md)), the shared conformance vectors, the same event line for the same tap as the iPhone, and "Open on your phone" for anything this device cannot draw.
- Tests: `cargo test`; `cargo clippy -- -D warnings`; `cargo build --release`.
- Never commit keys, team ids, certificates, keystores or personal data. Never touch `.github/`, signing or release scripts.
- Style: plain words in the UI, no em dashes, no developer tooling in what a person sees.
