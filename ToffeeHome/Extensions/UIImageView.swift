//
//  UIImageView.swift
//  ToffeeHome
//
//  Created by Khaled on 13/8/23.
//

import UIKit

class ImageLoader {
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data or unable to create UIImage.")
                completion(nil)
                return
            }
            
            completion(image)
        }.resume()
    }
}
