//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 19/09/2022.
//

import UIKit

class ViewController: UITableViewController {
    
    let refeicoes = ["Churros", "Batata"]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("tableviewcontroller carregado")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao
        return celula
    }
}

