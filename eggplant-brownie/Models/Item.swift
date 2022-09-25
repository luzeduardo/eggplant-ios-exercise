//
//  Item.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 20/09/2022.
//

import UIKit

class Item: NSObject {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
