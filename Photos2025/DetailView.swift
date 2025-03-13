//
//  DetailView.swift
//  Photos2025
//
//  Created by IMD 224 on 2025-02-26.
//

import SwiftUI
import Photos

struct DetailView: View {
    @Bindable var photo: Photo
    @State private var pickerVisible: Bool = false
    @State private var showCameraAlert:Bool = false
    @State private var imageSource = UIImagePickerController.SourceType.camera
    var body: some View {
        ZStack {
            VStack {
                Image(uiImage: photo.image)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .scaledToFit()
                TextField("Name", text: $photo.name)
                    .frame(width: 150, height: 50, alignment: .center)
                    .padding()
                Text(photo.date.formatted(date: .numeric, time: .shortened))
                    .padding()
            }
            if pickerVisible {
                ImageView(
                    pickerVisible: $pickerVisible,
                    sourceType: $imageSource,
                    action: {
                        (value) in
                        if let image = value {
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
                                self.photo.image = image
                            }
                        }
                    }
                )
            }
        }
        .toolbar {
            ToolbarItemGroup {
                Button(
                    action: {
                        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
                            if response && UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                                self.showCameraAlert = false
                                self.imageSource = UIImagePickerController.SourceType.camera
                                self.pickerVisible.toggle()
                            } else {
                                self.showCameraAlert = true
                            }
                        }
                    },
                    label: {
                        Image(systemName: "camera")
                    }
                )
                Button(
                    action: {
                        PHPhotoLibrary.requestAuthorization { status in
                            if status == .authorized {
                                self.imageSource = UIImagePickerController.SourceType.photoLibrary
                                self.pickerVisible = true
                            }
                        }
                    },
                    label: {
                        Image(systemName: "book")
                    }
                )
            }
        }
        .alert(isPresented: $showCameraAlert) {
            Alert(title: Text("Error"), message: Text("Camera not available."), dismissButton: .default(Text("OK")))
        }
    }
}
