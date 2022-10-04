//
//  RefeicaoDAO.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 04/10/2022.
//

import Foundation

class RefeicaoDAO {

    func save(_ refeicoes: [Refeicao]) {
        guard let caminho = recuperaCaminho() else { return }
        do {
            // NSKeyedArchiver requires the use of a try that should be invoked inside a do catch block
            let data = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try data.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }

    func recupera() -> [Refeicao]? {
        //Returns a URL by appending the specified path component to self.
        do {
            guard let caminho = recuperaCaminho() else { return nil }
            let data = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Refeicao> else { return nil }
            return refeicoesSalvas
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    func recuperaCaminho(path: String = "refeicao") -> URL? {
        // returns a directory to be used to persist data
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(path)
        return caminho
    }
}
