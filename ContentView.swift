import SwiftUI

struct ContentView: View {
    @StateObject private var wordData = WordData()
    @State private var learnedWords: Set<UUID> = []
    @State private var selectedCategory: String = "All"

    var body: some View {
        NavigationView {
            VStack {
                // Progress Tracker
                ProgressView(value: Double(learnedWords.count), total: Double(wordData.words.count))
                    .padding()

                // Category Picker
                Picker("Category", selection: $selectedCategory) {
                    Text("All").tag("All")
                    ForEach(wordData.categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                // Filtered Word List
                List(filteredWords) { word in
                    NavigationLink(destination: WordDetailView(word: word, learnedWords: $learnedWords)) {
                        WordCardView(word: word, learnedWords: $learnedWords)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical, 4)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Learn Spanish")
            }
            .background(Color.backgroundColor)
        }
    }

    // Filter words by selected category
    private var filteredWords: [Word] {
        if selectedCategory == "All" {
            return wordData.words
        } else {
            return wordData.words.filter { $0.category == selectedCategory }
        }
    }
}

struct WordCardView: View {
    let word: Word
    @Binding var learnedWords: Set<UUID>

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(word.word)
                .font(.title2)
                .bold()
                .foregroundColor(.primary)

            Text(word.translation)
                .font(.subheadline)
                .foregroundColor(.secondary)

            if learnedWords.contains(word.id) {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color.cardBackground)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}
