//
//  ModelData.swift
//  MovieApp
//
//  Created by Apple User on 11/5/22.
//

import Foundation
import Combine

final class ModelData:ObservableObject{
    @Published var landmarks: [Landmark] = load(filename:"landmarkData.json")
    var hikes : [Hike] = load(filename:"hikeData.json")
    
    var categories: [String:[Landmark]]{
        Dictionary(
            grouping:landmarks,
            by: {$0.category.rawValue}
        )
    }
}

func load<T: Decodable>( filename: String) -> T {
    let data:Data
    
    guard let file = Bundle.main.url(forResource:filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do{
        data=try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self,from:data)
    }catch{
        fatalError("Couldn't find \(filename) as \(T.self):\n\(error)")

    }
}
