//
//  BookCreatorView.swift
//  library
//
//  Created by Jose Antonio Landete Muñoz on 28/10/23.
//

import SwiftUI

struct BookCreatorView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode

    @State private var bookTitle = ""
    @State private var bookAuthor = ""
    
    
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("Título del libro", text: $bookTitle)
                }
                Section {
                    TextField("Autor", text: $bookAuthor)
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
                        newBook.author = bookAuthor
                        do {
                            try viewContext.save()
                            presentationMode.wrappedValue.dismiss() // Volver a la vista anterior

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
