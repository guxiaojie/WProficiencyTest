//
//  Photo.swift
//  WProficiencyTest
//
//  Created by Guxiaojie on 10/03/2018.
//  Copyright © 2018 SageGu. All rights reserved.
//

import Foundation

class Photo {
    var title: String?
    var imageHref: String?
    var description: String?
}


/*
 //Comments here: just tried to use JSONDecoder().decode(Canada.self, from: convertedData)
struct Canada: Decodable {
    let title: String
    let rows: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case title
        case rows
    }
}

struct Photo: Decodable {
    let title: String
    let imageHref: URL
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageHref
        case description
    }
}
*/
