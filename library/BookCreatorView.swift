//
//  BookCreatorView.swift
//  library
//
//  Created by Jose Antonio Landete Muñoz on 28/10/23.
//

import SwiftUI

struct BookCreatorView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var bookTitle = ""
    
    
    var body: some View {
        NavigationView {
            
            
            Form {
                Section {
                    TextField("Título del libro", text: $bookTitle)
                }
                Section {
                    TextField("Autor", text: $bookTitle)
                }
            }
            .navigationTitle("Agregar Libro")
            .navigationBarItems(
                leading: Button(action: {
                    
                }) {
                    Image(systemName: "chevron.backward")
                    
                },
                trailing: Button("Guardar") {
                    if !bookTitle.isEmpty {
                        let newBook = Book(context: viewContext)
                        newBook.title = bookTitle
                        do {
                            try viewContext.save()
                        } catch {
                            // Manejar errores de guardado
                            print("Error al guardar:       \(error)")
                        }
                    }
                }
                    .disabled(bookTitle.isEmpty)
            )
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        BookCreatorView()
    }
}
