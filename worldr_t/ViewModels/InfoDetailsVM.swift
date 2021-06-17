//
//  InfoDetailsVM.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

struct InfoDetailsVM {
    let text: String
    let textColor: UIColor
    let backgroundColor: UIColor
    var imageUrl: String?
    
    let textFont = UIFont.boldSystemFont(ofSize: 44)
    let textBackgroundColor = UIColor.clear
    let isEditable = false
    let imageWidth = CGFloat(300)
    let imageHeight = CGFloat(300)
    let textPadding = CGFloat(20)
    let spacing = CGFloat(10)
    let isEditble = false
    let topPadding = CGFloat(10)
    let leadingPadding = CGFloat(10)
    let trailingPadding = CGFloat(-10)
    let bottomPadding = CGFloat(0)
}

extension InfoDetailsVM {
    
    init(infoVM: InfoCellVM) {
        text = infoVM.text
        textColor = infoVM.textColor
        backgroundColor = infoVM.backgroundColor
        imageUrl = infoVM.urlString
    }
}
