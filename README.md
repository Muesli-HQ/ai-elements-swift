# AI Elements Swift

Native SwiftUI chat components maintained with Muesli. This is an independent adaptation of [Vercel AI Elements](https://github.com/vercel/ai-elements), with [Lucide](https://lucide.dev) vector icons. It is not an official Vercel product or a complete API-compatible port.

The package has no Muesli, AI SDK, React, provider, database, or third-party package dependencies. It targets macOS 14.2 and iOS 17. macOS is the currently validated platform; iOS is declared but not yet device-tested.

## Use

Add the package to your app:

```swift
.package(url: "https://github.com/Muesli-HQ/ai-elements-swift.git", from: "0.2.1")
```

Add `.product(name: "AIElementsSwift", package: "AIElementsSwift")` to the consuming target, then:

```swift
import AIElementsSwift
import SwiftUI

struct Answer: View {
    var body: some View {
        AIMessage(role: .assistant) {
            Text("Here are the next steps from your conversation.")
            AIDisclosure(title: "Meeting research", icon: .search) {
                AIActivityRow(title: "Read transcript", detail: "2 relevant passages", state: .completed)
            }
            AISourcePassage(number: 1, metadata: "Transcript · 10:42",
                            preview: "We agreed to review the proposal next week.") {
                // Open the exact source in your app.
            }
        }
    }
}
```

Use `AIPromptInput` to compose your own header, native editor, and footer. The library does not take ownership of keyboard handling, model settings, networking, source validation, or persistence. `AIAttachment` reports removal through a callback. `AIIcon` draws pinned Lucide geometry directly with SwiftUI paths, with no web view or runtime asset fetch.

## Available components

- `AIMessage`: role-aware layout and user bubble.
- `AIPromptInput`: compact, composable focused input surface.
- `AIAttachment`: removable context chip.
- `AIDisclosure`: keyboard-accessible expandable content.
- `AIActivityRow`: pending, running, completed, and failed operations.
- `AISourcePassage`: numbered source preview and activation.
- `AIElementsTheme`: environment-based color customization.
- `AIIcon`: selected Lucide vector artwork.
- `AIModelSelector` / `AIThinkingSlider`: model choices and discrete supported thinking levels.
- `AIResponse` / `AIMarkdownBlock`: native Markdown with headings, lists, quotes, code and tables.
- `AITool`: collapsible tool input/output/error cards with explicit execution states.
- `AIReasoning`: supplied reasoning summary content and request state.
- `AIShimmer`: animated thinking/status text, static with Reduce Motion.

The host supplies provider-visible reasoning summaries to a disclosure, and actual tool events to activity rows. Placeholder status copy is not a reasoning trace. These components do not fabricate provider activity. Model selection policy, mention autocomplete, citation validation, and source grouping remain application responsibilities. Markdown layout and model/effort controls are reusable; the host supplies allowed choices and validates changes. Reasoning request state is host-provided; Muesli marks it complete when its provider request finishes, not at an inferred internal reasoning boundary.

## Icon coverage

The package currently includes **23 Lucide icons**, rendered as native SwiftUI vectors. This is a curated subset for the current chat components, **not the complete Lucide catalog or every icon used across Vercel AI Elements**. Additional upstream components may need additional icons.

Available `AIIconName` cases:

| | | |
| --- | --- | --- |
| `archive` | `arrowUpRight` | `arrowUp` |
| `atSign` | `bookOpen` | `check` |
| `chevronDown` | `circleAlert` | `copy` |
| `cpu` | `download` | `ellipsis` |
| `fileText` | `loader` | `panelLeft` |
| `plus` | `rotateCcw` | `search` |
| `slidersHorizontal` | `squarePen` | `square` |
| `trash` | `x` | |

```swift
AIIcon(.search, size: 18)
    .foregroundStyle(.secondary)
```

Icons inherit the foreground style and scale from a 24-point design grid. They are decorative for accessibility; give the enclosing button or control an accessible label. They do not require SF Symbols, a web view, or network access. `AIShimmer` supplies animated thinking text separately from the `loader` artwork.

The checked-in SVGs live in [Upstream/Lucide](Upstream/Lucide), with generated paths in [AIIcon.swift](Sources/AIElementsSwift/AIIcon.swift). To expand coverage, add licensed SVGs from the pinned Lucide revision, update the generator mapping, run `python3 Scripts/generate_icons.py`, and run `swift test`. Unsupported SVG artwork fails generation rather than being silently approximated. Retain the Lucide/Feather notices when redistributing the icons.

## Development

```sh
swift build
swift test
python3 Scripts/generate_icons.py
```

Open the package in Xcode to explore its SwiftUI previews. Regenerate icons after changing the checked-in SVG subset. The generator accepts only supported SVG commands and fails on unsupported artwork; paths are not fetched at build time.

The standalone repository is [Muesli-HQ/ai-elements-swift](https://github.com/Muesli-HQ/ai-elements-swift). Muesli currently consumes a local copy during integration. See [PORTING.md](PORTING.md) for exact coverage and remaining work.

## Attribution and license

Swift adaptations are distributed under Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).

- Component composition and interaction concepts: **Vercel AI Elements**, copyright 2023 Vercel, Inc., Apache-2.0; reference revision `6a9d5b1822ffb10bba4bd97175f01edd7d8651cd`.
- Icon artwork: **Lucide Icons and Contributors**, ISC, including Feather-derived icons under MIT, copyright Cole Bemis. SVGs pinned to `70562c1ee1c4fdcf736fe97bc893fb8511927934` and mechanically converted to SwiftUI paths. Full notices are retained in `Licenses/Lucide-LICENSE`.

Upstream source and documentation: [Messages](https://elements.ai-sdk.dev/components/message), [Prompt Input](https://elements.ai-sdk.dev/components/prompt-input), [Tool](https://elements.ai-sdk.dev/components/tool), [Reasoning](https://elements.ai-sdk.dev/components/reasoning).
