//
//  RowView.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//

import SwiftUI

struct RowView: View {
    var photo: Photo
    var body: some View {
        GeometryReader { geometry in
            Image(uiImage: photo.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
//
//#Preview {
//    @Previewable @State var photo = Photo(image: UIImage(systemName: "ladybug")!, name: "Ladybug", date: Date())
//    RowView()
//}
