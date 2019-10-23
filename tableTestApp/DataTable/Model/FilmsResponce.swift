//
//  FilmsResponce.swift
//  tableTestApp
//
//  Created by Artem Chursin on 21.10.2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import Foundation

class FilmsResponce {
    
    func getData() -> [Films] {
        
        var filmsArray: [Films]
        
        let data: Data
        let path = "jsonFilms.json"
        
        
        guard let file = Bundle.main.url(forResource: path, withExtension: nil)
            else {
                fatalError("Couldn't find jsonFilms in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load jsonFilms from main bundle")
        }
        
        do {
            let decoder = JSONDecoder()
            let films = try decoder.decode([Films].self, from: data)
            filmsArray = films
        } catch {
            fatalError("Couldn't parse jsonFilms as")
        }
        
        return filmsArray
    }
}
