//
//  InfoVM.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import UIKit

struct InfoListVM {
    
    // MARK: - API
    func fetch(success: @escaping ([Info]) -> Void) {
        networkService.fetchData { infoArray in
            success(infoArray)
        }
    }
    
    let background = UIColor.lightGray
    let title = "List of data..."
    let bottomInset = CGFloat(1)
    let estimatedHeight = CGFloat(150)
    var isLoading = true
    
    // MARK: - Properties
    private let networkService = NetworkService()
}
