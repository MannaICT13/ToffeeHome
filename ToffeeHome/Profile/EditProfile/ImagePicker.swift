//
//  ImagePicker.swift
//  Binge
//
//  Created by Fahad on 9/8/23.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let photoPicker: ImagePicker
        
        init(_ photoPicker: ImagePicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[.editedImage] as? UIImage {
                guard  let data = image.jpegData(compressionQuality: 0.5), let compressedImage = UIImage(data: data) else {
                    return
                }
                photoPicker.selectedImage = compressedImage
                
            }
            
            picker.dismiss(animated: true)
        }
        
    }
}


