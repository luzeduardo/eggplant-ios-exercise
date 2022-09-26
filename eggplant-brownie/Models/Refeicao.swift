//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 20/09/2022.
//

import UIKit

class Refeicao: NSObject {
    let nome: String
    let calorias: Double
    var itens: Array<Item> = []
    
    init(nome: String, calorias: Double, itens: [Item] = []) {
        self.calorias = calorias
        self.nome = nome
        self.itens = itens
        
    }
    
    func totalDeCalorias() -> Double {
        var total: Double = 0
        
        for item in self.itens {
            total += item.calorias
        }
        return total
    }
}
