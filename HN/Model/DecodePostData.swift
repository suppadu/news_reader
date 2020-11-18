//
//  DecodePostData.swift
//  HN
//
//  Created by Дмитрий Константинов on 19.11.2020.
//

import Foundation

struct DecodePostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let url: String
    let points: Int
}
