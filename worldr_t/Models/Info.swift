//
//  Info.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import Foundation

struct Info: Decodable, Hashable {
    let id: String
    let text: String
    let attachments: InfoAttachment?
    
    struct InfoAttachment: Decodable, Hashable {
        let width: Double
        let height: Double
        let url: String
    }
}
