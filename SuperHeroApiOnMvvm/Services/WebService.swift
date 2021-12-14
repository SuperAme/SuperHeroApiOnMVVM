//
//  WebService.swift
//  SuperHeroApiOnMvvm
//
//  Created by Américo MQ on 13/12/21.
//

import Foundation

class WebService {
    func getHeroes(url: URL, completion: @escaping([HeroModel]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, err in
            if let err = err {
                print(err.localizedDescription)
                completion(nil)
            } else if let data = data {
                let heroList = try? JSONDecoder().decode([HeroModel].self, from: data)
                
                completion(heroList)
            }
        }.resume()
    }
}
