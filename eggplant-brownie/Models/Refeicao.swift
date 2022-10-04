//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 20/09/2022.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    let nome: String
    let felicidade: Double
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Double, itens: [Item] = []) {
        self.felicidade = felicidade
        self.nome = nome
        self.itens = itens
        
    }
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeDouble(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    func totalDeCalorias() -> Double {
        var total: Double = 0
        
        for item in self.itens {
            total += item.calorias
        }
        return total
    }

    func detalhes() -> String {
        var mensagem : String = "Felicidade: \(felicidade) \n"
        for item in itens {
            mensagem += " - item: \(item.nome), calorias: \(item.calorias)\n"
        }
        return mensagem
    }
}
