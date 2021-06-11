//
//  ImageHelper.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

class ImageHelper {
    
    // MARK: - API
    static let shared = ImageHelper()

    var imageCache = NSCache<NSString, UIImage>()    
}
