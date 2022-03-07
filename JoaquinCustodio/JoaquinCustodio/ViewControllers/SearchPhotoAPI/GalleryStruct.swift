//
//  GalleryStruct.swift
//  JoaquinCustodio
//
//  Created by Joaquin Custodio  on 17/2/22.
//

import Foundation

// Formato del JSON

struct Unknown: Codable{
    let results:[Results]
}

struct Results:Codable{
    let likes:Int?
    let urls:Urls
    let user:User
}

struct Urls: Codable{
    let regular:String?
}

struct User:Codable{
    let username:String?
    let profile_image:profile_image
}

struct profile_image:Codable{
    let medium:String?
}
