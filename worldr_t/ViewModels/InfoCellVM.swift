//
//  InfoCellVM.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

struct InfoCellVM {
    let text: String
    let urlString: String?
    
    let textFont = UIFont.boldSystemFont(ofSize: 18)
    let textColor = UIColor(red: 242/255.0, green: 215/255.0, blue: 102/255.0, alpha: 1)
    let numberOfLines = 0
    let backgroundColor = UIColor(red: 66/255.0, green: 66/255.0, blue: 66/255.0, alpha: 1)
    let spacing = CGFloat(10)
    let imageWidth = CGFloat(70)
    let imageHeight = CGFloat(70)
    let leadingAnchor = CGFloat(10)
    let trailingAnchor = CGFloat(-10)
    
    var isImageHidden: Bool {
        return urlString == nil
    }
}

extension InfoCellVM {
    init(info: Info) {
        text = info.text
        
        if let url = info.attachments?.url {
            urlString = url
        } else {
            urlString = nil
        }
    }
    
    var placeHolderImage: UIImage? {
        return UIImage(named: "ph")
    }
}
