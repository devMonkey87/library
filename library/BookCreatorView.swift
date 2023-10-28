//
//  BookCreatorView.swift
//  library
//
//  Created by Jose Antonio Landete Muñoz on 28/10/23.
//

import SwiftUI

struct BookCreatorView: View {
    @Environment(\.managedObjectContext) private var viewContext
      @Binding var isPresented: Bool
      @State private var bookTitle = ""
      
      var body: some View {
          NavigationView {
              Form {
                  Section {
                      TextField("Título del libro", text: $bookTitle)
                  }
              }
              .navigationTitle("Agregar Libro")
              .navigationBarItems(
                  leading: Button("Cancelar") {
                      isPresented = false
                  },
                  trailing: Button("Guardar") {
                      if !bookTitle.isEmpty {
                          let newBook = Book(context: viewContext)
                          newBook.title = bookTitle
                          do {
                              try viewContext.save()
                              isPresented = false // Cierra la vista modal
                          } catch {
                              // Manejar errores de guardado
                              print("Error al guardar: \(error)")
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
          BookCreatorView(isPresented: .constant(true))
      }
}
