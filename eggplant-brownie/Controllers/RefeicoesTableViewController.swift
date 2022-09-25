//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 25/09/2022.
//

import UIKit

class RefeicoesTableViewController : UITableViewController {
    
    var refeicoes = [Refeicao(nome: "Macarrão", calorias: 100),
                     Refeicao(nome: "Chocolate", calorias: 99.3)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        return celula
    }

    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
    }
}
