# AI Elements Swift

Native SwiftUI chat components maintained with Muesli. This is an independent adaptation of [Vercel AI Elements](https://github.com/vercel/ai-elements), with [Lucide](https://lucide.dev) vector icons. It is not an official Vercel product or a complete API-compatible port.

The package has no Muesli, AI SDK, React, provider, database, or third-party package dependencies. It targets macOS 14.2 and iOS 17. macOS is the currently validated platform; iOS is declared but not yet device-tested.

## Use

Add the package to your app:

```swift
.package(url: "https://github.com/Muesli-HQ/ai-elements-swift.git", from: "0.3.0")
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

The package includes **47 Lucide icons**. A source audit verifies **all 33 distinct Lucide icons** imported by the **19 components in Vercel’s Chatbot category**, including their recursively imported in-repository component dependencies (**40 source files**). This adds 24 icons to the original 23; 14 existing Muesli-oriented icons are outside that audited set.

Audited AI Elements revision: [`6a9d5b1822ffb10bba4bd97175f01edd7d8651cd`](https://github.com/vercel/ai-elements/tree/6a9d5b1822ffb10bba4bd97175f01edd7d8651cd/packages/elements/src). Lucide SVG revision: [`70562c1ee1c4fdcf736fe97bc893fb8511927934`](https://github.com/lucide-icons/lucide/tree/70562c1ee1c4fdcf736fe97bc893fb8511927934/icons).

**Component scope:** `attachments`, `chain-of-thought`, `checkpoint`, `confirmation`, `context`, `conversation`, `inline-citation`, `message`, `model-selector`, `plan`, `prompt-input`, `question`, `queue`, `reasoning`, `shimmer`, `sources`, `suggestion`, `task`, `tool`. Dependencies include `code-block` and the imported shadcn UI primitives, so selector/search, spinner, dropdown and carousel icons are covered too.

This is complete **Lucide import coverage for that pinned scope**, not full component parity or the complete Lucide/AI Elements catalog. External npm internals (such as Streamdown), docs/examples, consumer-supplied icons, custom inline SVGs (such as the context usage ring), and other component categories are excluded. In particular, feedback icons supplied by application examples are not claimed as audited component defaults. See [PORTING.md](PORTING.md) for component behavior still to port.

[The machine-readable audit](Upstream/chat-icon-coverage.json) records every inspected source file, exact import, canonical SVG, Swift case, and SVG SHA-256. The following mappings are verified against source, including Lucide aliases:

| Upstream Lucide import | Canonical SVG | `AIIconName` |
| --- | --- | --- |
| `ArrowDownIcon` | `arrow-down` | `.arrowDown` |
| `ArrowLeft` | `arrow-left` | `.arrowLeft` |
| `ArrowLeftIcon` | `arrow-left` | `.arrowLeft` |
| `ArrowRight` | `arrow-right` | `.arrowRight` |
| `ArrowRightIcon` | `arrow-right` | `.arrowRight` |
| `BookIcon` | `book` | `.book` |
| `BookmarkIcon` | `bookmark` | `.bookmark` |
| `BrainIcon` | `brain` | `.brain` |
| `CheckCircleIcon` | `circle-check-big` | `.circleCheckBig` |
| `CheckIcon` | `check` | `.check` |
| `ChevronDownIcon` | `chevron-down` | `.chevronDown` |
| `ChevronLeftIcon` | `chevron-left` | `.chevronLeft` |
| `ChevronRightIcon` | `chevron-right` | `.chevronRight` |
| `ChevronUpIcon` | `chevron-up` | `.chevronUp` |
| `ChevronsUpDownIcon` | `chevrons-up-down` | `.chevronsUpDown` |
| `CircleIcon` | `circle` | `.circle` |
| `ClockIcon` | `clock` | `.clock` |
| `CopyIcon` | `copy` | `.copy` |
| `CornerDownLeftIcon` | `corner-down-left` | `.cornerDownLeft` |
| `DotIcon` | `dot` | `.dot` |
| `DownloadIcon` | `download` | `.download` |
| `FileTextIcon` | `file-text` | `.fileText` |
| `GlobeIcon` | `globe` | `.globe` |
| `ImageIcon` | `image` | `.image` |
| `Loader2Icon` | `loader-circle` | `.loaderCircle` |
| `Monitor` | `monitor` | `.monitor` |
| `Music2Icon` | `music-2` | `.music2` |
| `PaperclipIcon` | `paperclip` | `.paperclip` |
| `PlusIcon` | `plus` | `.plus` |
| `SearchIcon` | `search` | `.search` |
| `SquareIcon` | `square` | `.square` |
| `VideoIcon` | `video` | `.video` |
| `WrenchIcon` | `wrench` | `.wrench` |
| `XCircleIcon` | `circle-x` | `.circleX` |
| `XIcon` | `x` | `.x` |

Additional existing cases: `.archive`, `.arrowUpRight`, `.arrowUp`, `.atSign`, `.bookOpen`, `.circleAlert`, `.cpu`, `.ellipsis`, `.loader`, `.panelLeft`, `.rotateCcw`, `.slidersHorizontal`, `.squarePen`, `.trash`.

```swift
AIIcon(.search, size: 18)
    .foregroundStyle(.secondary)
```

Icons inherit the foreground style and scale from a 24-point design grid. They are decorative for accessibility; give the enclosing button or control an accessible label. They do not require SF Symbols, a web view, or network access. `AIShimmer` supplies animated thinking text separately from the `loader` artwork.

The checked-in SVGs live in [Upstream/Lucide](Upstream/Lucide), with generated paths in [AIIcon.swift](Sources/AIElementsSwift/AIIcon.swift). To expand coverage, add licensed SVGs from the pinned Lucide revision, run `python3 Scripts/generate_icons.py`, and run `swift test`. To reproduce the source audit with local checkouts at the pinned revisions, run `python3 Scripts/audit_chat_icons.py /path/to/ai-elements /path/to/lucide`, then regenerate and test. The audit copies missing SVGs and fails if a known SVG differs from upstream. Unsupported SVG artwork fails generation rather than being silently approximated. Retain the Lucide/Feather notices when redistributing the icons.

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
