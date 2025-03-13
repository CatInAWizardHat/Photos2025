//
//  ContentView.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // @State var photos = [Photo]()
    @Environment(\.modelContext) private var modelContext
    @Query var photos: [Photo] = [Photo(image: UIImage(systemName: "ladybug")!, name: "Ladybug", date: Date())]
    var body: some View {
        NavigationStack {
            List {
                ForEach(photos) { photo in
                    @State var photo: Photo = photo
                    NavigationLink(destination: DetailView(photo: photo)
                                   , label: {
                        RowView(photo: photo)
                            .padding()
                    })
                }
                .onDelete {
                    if let index = $0.first {
                        modelContext.delete(photos[index])
                    }
                }
//                .onMove {
//                    modelContext.move(fromOffsets: $0, toOffset: $1)
//                }
            }
            .navigationTitle("Photos")
            .toolbar {
                HStack {
                    EditButton()
                    Button(action: {
                        modelContext.insert(Photo(image: UIImage(systemName: "ladybug")!, name: "Ladybug", date: Date()))
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
