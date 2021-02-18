//
//  ImageModel.swift
//  Project01
//
//  Created by meister on 2021/02/18.
//

import Foundation

struct ImageModel: Decodable {
    var id: String
    var urls: Thumb
}

struct Thumb: Decodable {
    var thumb: String
}
