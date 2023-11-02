//
//  BookVisualizer.swift
//  library
//
//  Created by Jose Antonio Landete Muñoz on 31/10/23.
//

import SwiftUI

struct BookVisualizer: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var speed = 5.0
    @State private var isEditing = false
    var book: Book
    
    
    func deleteBook(book: Book) {
        viewContext.delete(book) // Eliminar el libro del contexto
        
        do {
            try viewContext.save() // Guardar los cambios en el contexto
            
        } catch {
            // Manejar errores de guardado
            print("Error al guardar: \(error)")
        }
    }
    
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Image("library")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            HStack{
                Text("📕")
                Text(self.book.title ?? "LOL")
                Label(self.book.author ?? "Stephen King", systemImage: "42.circle")
            }
            
            Button(action: {
                deleteBook(book: self.book)
            }) {
                Text("Delete book")
            }
            
            Section {
                Slider(
                    value: $speed,
                    in: 0...100,
                    onEditingChanged: { editing in
                        isEditing = editing
                    }
                )
                Text("Score")
                    .foregroundColor(isEditing ? .red : .green)
            }
            
        }
        
    }
    
}

struct BookVisualizer_Previews: PreviewProvider {
    static var previews: some View {
        let sampleBook = Book() // Crea una instancia de Book con tus datos
        sampleBook.title = "Ejemplo de título"
        sampleBook.author = "Autor de ejemplo"
        // Asigna otros atributos según tu modelo de datos
        
        return BookVisualizer(book: sampleBook)
    }
}

