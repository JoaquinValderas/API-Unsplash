//
//  GalleryResponse.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 17/2/22.
//
//
//import Foundation
//import UIKit
//
//
//struct GalleryResponseData: Decodable {
//    let photos: [StructGallery]
//
//    enum CodingKeys: String, CodingKey {
//        case results
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.photos = try container.decode([StructGallery].self, forKey: .results)
//    }
//}
