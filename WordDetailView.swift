import SwiftUI

struct WordDetailView: View {
    let word: Word
    @Binding var learnedWords: Set<UUID>
    @State private var showPronunciation: Bool = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                Text("Translation: \(word.translation)")
                    .font(.title2)
                    .foregroundColor(.secondary)

                if showPronunciation {
                    Text("Pronunciation: \(word.pronunciation)")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }

                Text("Example: \(word.exampleSentence)")
                    .font(.body)
                    .padding()
                    .background(Color.cardBackground)
                    .cornerRadius(10)

                // Pronunciation Button
                Button(action: {
                    showPronunciation = true
                
                }) {
                    HStack {
                        Text("Practice Pronunciation")
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.primaryColor, Color.secondaryColor]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(color: Color.primaryColor.opacity(0.3), radius: 5, x: 0, y: 2)
                }

                // Mark as Learned Button
                Button(action: {
                    learnedWords.insert(word.id)
                }) {
                    HStack {
                        Image(systemName: learnedWords.contains(word.id) ? "checkmark.circle.fill" : "checkmark.circle")
                        Text(learnedWords.contains(word.id) ? "Learned" : "Mark as Learned")
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(learnedWords.contains(word.id) ? Color.green : Color.gray.opacity(0.2))
                    .foregroundColor(learnedWords.contains(word.id) ? .white : .primary)
                    .cornerRadius(10)
                }

                // Quiz Button
                NavigationLink(destination: QuizView(words: [word])) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                        Text("Take a Quiz")
                    }
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .background(Color.backgroundColor)
        .navigationTitle(word.word)
    }
}

