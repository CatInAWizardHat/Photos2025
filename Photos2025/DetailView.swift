//
//  DetailView.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//

import SwiftUI

struct DetailView: View {
    @Bindable var photo: Photo
    var body: some View {
        VStack {
            Image(uiImage: photo.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .padding()
            TextField("Name", text: $photo.name)
                .frame(width: 150, height: 50, alignment: .center)
                .padding()
            Text(photo.date.formatted(date: .numeric, time: .shortened))
                .padding()
        }
    }
}
