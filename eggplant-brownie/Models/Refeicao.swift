//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 20/09/2022.
//

import UIKit

class Refeicao: NSObject {
    let nome: String
    let felicidade: Double
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Double, itens: [Item] = []) {
        self.felicidade = felicidade
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
