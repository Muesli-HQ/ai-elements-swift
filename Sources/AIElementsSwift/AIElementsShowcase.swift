import SwiftUI

#if DEBUG
#Preview("Conversation components") {
    ScrollView {
        VStack(alignment: .leading, spacing: 20) {
            AIMessage(role: .user) {
                Text("What did we decide about the launch?").font(.system(size: 14))
            }
            AIMessage(role: .assistant) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("The team agreed to launch Friday after the final review. [1]")
                        .font(.system(size: 14))
                    AIDisclosure(title: "Research activity", icon: .search, initiallyExpanded: true) {
                        VStack(alignment: .leading, spacing: 10) {
                            AIActivityRow(title: "Search meetings", detail: "Launch planning", state: .completed)
                            AIActivityRow(title: "Check source references", state: .running)
                        }
                    }
                    AIDisclosure(title: "1 source", icon: .bookOpen, initiallyExpanded: true) {
                        AISourcePassage(number: 1, metadata: "Planning · Transcript · 12:30",
                                        preview: "Let's launch Friday once the final review is complete.", action: {})
                    }
                }
            }
            AIPromptInput(isFocused: true) {
                AIAttachment(title: "Launch planning", onRemove: {})
            } editor: {
                TextField("Ask a follow-up…", text: .constant(""))
                    .textFieldStyle(.plain).padding(.vertical, 8)
            } footer: {
                HStack {
                    Text("Model · Thinking level").font(.system(size: 11)).foregroundStyle(.secondary)
                    Spacer()
                    Button(action: {}) { AIIcon(.arrowUp, size: 14) }
                        .accessibilityLabel("Send question")
                }
            }
        }.padding(24)
    }.frame(width: 560, height: 620)
}
#endif
