//
//  Music.swift
//  C5
//
//  Created by Soop on 8/17/25.
//

import Foundation

struct Music {
    var title: String
    var artist: String
    var number: String
//    var image
}

extension Music {
    static var sample: [Music] {
        return [
            .init(title: "Hello", artist: "World", number: "123456"),
            .init(title: "Swift", artist: "Language", number: "678990"),
        ]
    }
}
