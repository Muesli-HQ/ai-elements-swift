# Port coverage

Checked against Vercel AI Elements' component inventory on 12 October 2026.
This is an initial SwiftUI adaptation, not full behavioral or API parity.

## Available in the package

| Upstream area | SwiftUI implementation | Remaining work |
| --- | --- | --- |
| Message | AIMessage: role-aware layout | Reusable action bar, branching, rich Markdown response renderer |
| Prompt input | AIPromptInput: header/editor/footer surface | Bundled editor, submission state machine, uploads and drag/drop |
| Attachments | AIAttachment: removable document/context chip | Image/audio/video previews, grid and list variants, metadata |
| Sources / inline citations | AISourcePassage + AIDisclosure | Citation parsing, inline badges/popovers and grouped source container |
| Tool / task activity | AIActivityRow + AIDisclosure | Structured tool cards, typed input/output views and error detail |
| Reasoning / chain of thought | AIDisclosure + activity primitives | Dedicated streaming summary component, duration and controlled expansion |
| Theme / icons | AIElementsTheme + 23 Lucide icons | Expanded icon subset and typography/density tokens |

Generic primitives support these patterns but do not constitute dedicated ports of each upstream component.

## Present in Muesli, not yet reusable library components

- Conversation scroll view and history sidebar.
- Model and thinking-level selector.
- Saved-meeting mention autocomplete with keyboard navigation.
- Native AppKit text editor and send/stop controls.
- Markdown answer rendering, inline citation links, source grouping and popovers.
- Quick suggestions, copy/export actions, error/retry presentation.
- Transient provider reasoning summaries and real research activity events.

These are the next useful extraction candidates. Keep provider/data policy in the host; extract only UI and event interfaces. Reasoning displays must use provider-designated visible content, not inferred private thought traces.

## Not ported

No dedicated reusable equivalents yet for the following upstream components:

- Core chat: conversation, model-selector, suggestion, reasoning, chain-of-thought, tool, sources, inline-citation, context, confirmation, question, queue, plan, task, checkpoint, shimmer, toolbar, open-in-chat.
- Rich output/developer views: artifact, code-block, snippet, image, web-preview, jsx-preview, file-tree, terminal, stack-trace, test-results, schema-display, package-info, environment-variables, commit, sandbox, agent.
- Audio/voice: audio-player, mic-selector, speech-input, transcription, voice-selector, persona.
- Workflow canvas: canvas, node, edge, connection, controls, panel.

The existing message, prompt-input, and attachments adaptations are partial as described above. We do not plan to port unrelated workflow/developer components merely to claim catalog parity.

## Testing in MuesliDevB

Existing conversations immediately use the current renderer: user bubbles, answer layout, copy/export icons, grouped citations and passage previews. No response regeneration or database migration is needed for those visual changes.

The composer uses the new input surface and attachment chips. Type @ to open saved-meeting suggestions; the autocomplete itself remains Muesli-specific. Model/thinking selection also remains Muesli-specific with the shared Lucide icons.

New requests can show reusable activity rows and summary disclosures when events are emitted. Historical conversations do not gain research traces or reasoning summaries retroactively: those events are transient in the current app. Summary content appears only if the provider returns it.
