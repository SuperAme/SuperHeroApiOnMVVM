//
//  HeroModel.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 13/12/21.
//

import Foundation

struct HeroModel: Codable {
    let name: String?
    let biography: Publisher
    let images: HeroImage
}

struct HeroImage: Codable {
    let md: String?
}

struct Publisher: Codable {
    let publisher: String?
}
