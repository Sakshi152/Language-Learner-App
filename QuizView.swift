import SwiftUI

struct QuizView: View {
    let words: [Word]
    @State private var currentIndex: Int = 0
    @State private var score: Int = 0
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            if currentIndex < words.count {
                Text("What is the translation of \(words[currentIndex].word)?")
                    .font(.title)
                    .bold()
                    .padding()

                ForEach(shuffledOptions(), id: \.self) { option in
                    Button(action: {
                        checkAnswer(selectedOption: option)
                    }) {
                        Text(option)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(color: Color.primaryColor.opacity(0.3), radius: 5, x: 0, y: 2)
                    }
                }
            } else {
                Text("Quiz Complete! Your score is \(score)/\(words.count)")
                    .font(.title)
                    .bold()
                    .padding()
            }
        }
        .padding()
        .background(Color.backgroundColor)
        .navigationTitle("Quiz")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(alertMessage.contains("Correct") ? "Correct!" : "Incorrect!"),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")) {
                    if currentIndex < words.count - 1 {
                        currentIndex += 1
                    }
                }
                )
        }
    }

    private func shuffledOptions() -> [String] {
        let correctTranslation = words[currentIndex].translation
        let wrongTranslation = getWrongTranslation(for: words[currentIndex])
        return [correctTranslation, wrongTranslation].shuffled()
    }

    private func getWrongTranslation(for word: Word) -> String {
        let otherWords = words.filter { $0.id != word.id }
        return otherWords.randomElement()?.translation ?? "Unknown"
    }

    private func checkAnswer(selectedOption: String) {
        if selectedOption == words[currentIndex].translation {
            score += 1
            alertMessage = "Correct! Well done!"
        } else {
            alertMessage = "Incorrect! The correct translation is \(words[currentIndex].translation)."
        }
        showAlert = true
    }
}
