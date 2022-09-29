//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 25/09/2022.
//

import UIKit

class RefeicoesTableViewController : UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 100),
                     Refeicao(nome: "Chocolate", felicidade: 99.3)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        return celula
    }

    func add(_ refeicao: Refeicao) {
        print("Add \(refeicao.nome) chamado")
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    //  se prepara antes de seguir para o prox view controller a ser apresentado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
}
