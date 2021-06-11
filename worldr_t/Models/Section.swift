//
//  Section.swift
//  worldr_t
//
//  Created by Pavle Mijatovic on 11.6.21..
//

import Foundation

struct Section: Decodable, Hashable {
    var id: UUID? = UUID()
    let infoArray: [Info]
}
