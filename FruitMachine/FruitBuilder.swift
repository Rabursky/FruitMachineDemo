//
//  FruitBuilder.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import SwiftyJSON

class FruitBuilder: ModelBuilder<Fruit> {
    override func buildInstanceWithJSON(json: JSON) -> Fruit? {
        guard let name = json["name"].string, let imageName = json["imageName"].string else {
            return nil
        }
        
        return Fruit(name: name, imageName: imageName)
    }
}
