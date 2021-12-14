//
//  HeroViewModel.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 14/12/21.
//

import Foundation

struct HeroListViewModel {
    let heroes: [HeroModel]
}

extension HeroListViewModel {
    var numberOfSections: Int {
        return 1
    }
    func numberOfItemsInSection(_ section: Int) -> Int {
        return self.heroes.count
    }
    
    func heroAtIndex(_ index: Int) -> HeroViewModel {
        let hero = self.heroes[index]
        return HeroViewModel(hero)
    }
}

struct HeroViewModel {
    private let hero: HeroModel
}

extension HeroViewModel {
    init(_ hero: HeroModel) {
        self.hero = hero
    }
}

extension HeroViewModel {
    var name: String {
        return self.hero.name ?? "No name"
    }
    
    var publisher: String {
        return self.hero.biography.publisher ?? "No info"
    }
    
    var imageURL: String {
        return self.hero.images.md ?? "https://ast.m.wikipedia.org/wiki/Ficheru:No_image_available.svg"
    }
}
