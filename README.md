# ♻️ Reflex Example (Luau)

A minimal Luau example project using [Reflex](https://littensy.github.io/reflex) for state management.

Currently, this example has:

-   🍰 Shared producer slices
-   💾 Player data with Lapis
-   🛰️ Server-to-client data syncing

## 📦 Usage

Clone this repository to get started.

```bash
git clone https://github.com/littensy/reflex-example-luau.git

cd reflex-example-luau
wally install
rojo sourcemap -o sourcemap.json
wally-package-types --sourcemap sourcemap.json Packages
```

## ⚙️ Pre-requisites

-   [Aftman](https://github.com/LPGhatguy/aftman)
-   [Rojo](https://rojo.space/docs/installation/)
-   [Wally](https://wally.run)

## 📂 Recommended Extensions

-   [TestEZ Companion](https://marketplace.visualstudio.com/items?itemName=tacheometrist.testez-companion)
-   [Selene](https://marketplace.visualstudio.com/items?itemName=Kampfkarren.selene-vscode)
-   [Luau LSP](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.luau-lsp)
-   [StyLua](https://marketplace.visualstudio.com/items?itemName=JohnnyMorganz.stylua)