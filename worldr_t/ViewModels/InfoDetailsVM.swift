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
    
    let textFont = UIFont.boldSystemFont(ofSize: 20)
    let isEditable = false
    let imageWidth = CGFloat(300)
    let imageHeight = CGFloat(300)
    let textPadding = CGFloat(20)
    let spacing = CGFloat(10)
}

extension InfoDetailsVM {
    
    init(infoVM: InfoCellVM) {
        text = infoVM.text
        textColor = infoVM.textColor
        backgroundColor = infoVM.backgroundColor
        imageUrl = infoVM.urlString
    }
}
