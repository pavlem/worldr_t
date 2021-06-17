//
//  InfoImageVM.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class InfoImageVM {
    
    var imageUrlString: String
    var imagePlaceholderName: String
    var isRounded = false
    var imageTransition = Double(1)

    init(imageUrlString: String, imagePlaceholderName: String = InfoCellVM.imagePlaceholderName) {
        self.imageUrlString = imageUrlString
        self.imagePlaceholderName = imagePlaceholderName
    }

    func getImage(withName imageName: String, completion: @escaping (Result<UIImage, Error>) -> ()) {
        urlSessionDataTask = moviewService.fetch(image: imageName, completion: { (result) in
            completion(result)
        })
    }
    
    func cancelImageDownload() {
        urlSessionDataTask?.cancel()
    }
    
    // MARK: - Properties
    private var urlSessionDataTask: URLSessionDataTask?
    private let moviewService = NetworkService()
}

extension InfoImageVM {
    func getCachedImage(imageName: String) -> UIImage? {
        if let image = ImageHelper.shared.imageCache.object(forKey: imageName as NSString) {
            return image
        }
        return nil
    }
    
    func cache(image: UIImage, key: String) {
        ImageHelper.shared.imageCache.setObject(image, forKey: key as NSString)
    }
}
