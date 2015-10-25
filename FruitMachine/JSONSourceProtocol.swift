//
//  JSONSourceProtocol.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import SwiftyJSON

protocol JSONSounrceProtocol {
    func getJSON() throws -> JSON
}
