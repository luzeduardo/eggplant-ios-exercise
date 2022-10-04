//
//  ItemDAO.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 04/10/2022.
//

import Foundation

class ItemDAO {
    func save(_ items: [Item]) {
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }

    func recupera() -> [Item]? {
        do {
            guard let diretorio = recuperaDiretorio() else { return nil }
            let dados = try Data(contentsOf: diretorio)
            let itemsSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itemsSalvos
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func recuperaDiretorio(path: String = "itens") -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(path)
        return caminho
    }
}
