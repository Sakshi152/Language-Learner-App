import Foundation

struct Word: Identifiable {
    let id = UUID()
    let word: String
    let translation: String
    let pronunciation: String
    let exampleSentence: String
    let category: String
}
