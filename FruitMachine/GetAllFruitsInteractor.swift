//
//  GetAllFruitsInteractor.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import SwiftyJSON

class GetAllFruitsInteractor {
    var output: [Fruit]?
    
    let source: JSONSounrceProtocol
    let builder: ModelBuilder<Fruit>
    
    init(source: JSONSounrceProtocol, builder: ModelBuilder<Fruit>) {
        self.source = source
        self.builder = builder
    }
    
    func execute() throws -> () {
        let json: JSON = try source.getJSON()
        var fruits = [Fruit]()
        if let array = json.array {
            for objectJSON in array {
                if let fruit = builder.buildInstanceWithJSON(objectJSON) {
                    fruits.append(fruit)
                }
            }
        }
        output = fruits
    }
}
