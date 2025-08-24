import Foundation
import SwiftUI

class WordData: ObservableObject {
    @Published var words: [Word] = [
        // Greetings
        Word(word: "Hola", translation: "Hello", pronunciation: "oh-lah", exampleSentence: "Hola, ¿cómo estás?", category: "Greetings"),
        Word(word: "Adiós", translation: "Goodbye", pronunciation: "ah-dee-ohs", exampleSentence: "Adiós, nos vemos mañana.", category: "Greetings"),
        Word(word: "Gracias", translation: "Thank you", pronunciation: "grah-see-ahs", exampleSentence: "Gracias por tu ayuda.", category: "Greetings"),
        Word(word: "Por favor", translation: "Please", pronunciation: "por fah-vor", exampleSentence: "Por favor, deme agua.", category: "Greetings"),
        Word(word: "Buenos días", translation: "Good morning", pronunciation: "bweh-nos dee-as", exampleSentence: "Buenos días, ¿cómo amaneciste?", category: "Greetings"),
        Word(word: "Buenas noches", translation: "Good night", pronunciation: "bweh-nas noh-ches", exampleSentence: "Buenas noches, que descanses.", category: "Greetings"),
        Word(word: "¿Cómo estás?", translation: "How are you?", pronunciation: "koh-moh ehs-tahs", exampleSentence: "¿Cómo estás? Estoy bien, gracias.", category: "Greetings"),

        // Food
        Word(word: "Manzana", translation: "Apple", pronunciation: "mahn-sah-nah", exampleSentence: "Me gusta comer manzanas.", category: "Food"),
        Word(word: "Agua", translation: "Water", pronunciation: "ah-gwah", exampleSentence: "Necesito un vaso de agua.", category: "Food"),
        Word(word: "Pan", translation: "Bread", pronunciation: "pahn", exampleSentence: "El pan está caliente.", category: "Food"),
        Word(word: "Leche", translation: "Milk", pronunciation: "leh-cheh", exampleSentence: "Prefiero la leche fría.", category: "Food"),
        Word(word: "Arroz", translation: "Rice", pronunciation: "ah-rohs", exampleSentence: "El arroz con pollo es delicioso.", category: "Food"),
        Word(word: "Pescado", translation: "Fish", pronunciation: "pehs-kah-doh", exampleSentence: "El pescado está fresco.", category: "Food"),
        Word(word: "Café", translation: "Coffee", pronunciation: "kah-feh", exampleSentence: "Me encanta el café por la mañana.", category: "Food"),

        // Travel
        Word(word: "Autobús", translation: "Bus", pronunciation: "ow-toh-boos", exampleSentence: "Tomaré el autobús al trabajo.", category: "Travel"),
        Word(word: "Aeropuerto", translation: "Airport", pronunciation: "ah-eh-roh-pwehr-toh", exampleSentence: "El aeropuerto está lejos.", category: "Travel"),
        Word(word: "Hotel", translation: "Hotel", pronunciation: "oh-tel", exampleSentence: "Reservé una habitación en el hotel.", category: "Travel"),
        Word(word: "Taxi", translation: "Taxi", pronunciation: "tahk-see", exampleSentence: "Tomaré un taxi al centro.", category: "Travel"),
        Word(word: "Estación", translation: "Station", pronunciation: "ehs-tah-see-on", exampleSentence: "La estación de tren está cerca.", category: "Travel"),
        Word(word: "Pasaporte", translation: "Passport", pronunciation: "pah-sah-por-teh", exampleSentence: "No olvides tu pasaporte.", category: "Travel"),
        Word(word: "Equipaje", translation: "Luggage", pronunciation: "eh-kee-pah-heh", exampleSentence: "Mi equipaje está en la cinta.", category: "Travel"),

        // Numbers
        Word(word: "Uno", translation: "One", pronunciation: "oo-noh", exampleSentence: "Tengo uno libro.", category: "Numbers"),
        Word(word: "Dos", translation: "Two", pronunciation: "dohs", exampleSentence: "Hay dos manzanas.", category: "Numbers"),
        Word(word: "Tres", translation: "Three", pronunciation: "trehs", exampleSentence: "Necesito tres tazas.", category: "Numbers"),
        Word(word: "Cuatro", translation: "Four", pronunciation: "kwah-troh", exampleSentence: "El niño tiene cuatro años.", category: "Numbers"),
        Word(word: "Cinco", translation: "Five", pronunciation: "seen-koh", exampleSentence: "Son las cinco de la tarde.", category: "Numbers"),
        Word(word: "Diez", translation: "Ten", pronunciation: "dee-ehs", exampleSentence: "Hay diez personas en la sala.", category: "Numbers")
    ]

    // Get unique categories
    var categories: [String] {
        Array(Set(words.map { $0.category })).sorted()
    }
}
