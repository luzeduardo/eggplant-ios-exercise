//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 19/09/2022.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItemsDelegate {
    // MARK: - Atributes
    var delegate: RefeicoesTableViewController?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var caloriaTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaritem = UIBarButtonItem(title: "Adiciona Item", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaritem
    }

    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    @objc func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }

    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula
    }

    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        let linha = indexPath.row
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[linha])
        } else {
            celula.accessoryType = .none
            let item = itens[linha]
            guard let position = itensSelecionados.firstIndex(of: item) else { return }
            itensSelecionados.remove(at: position)
        }
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeRefeicao = nomeTextField?.text else {
            print("guard nomeRefeicao")
            return
        }
        
        guard let caloriaRefeicao = caloriaTextField?.text else {
            print("guard caloriaRefeicao")
            return
        }
        
        let nomeValue = nomeRefeicao
        let caloria = Double(caloriaRefeicao)
        
        guard let caloriaValue = caloria else {
            print("guard caloriaValue")
            return
        }
        
        let refeicao = Refeicao(nome: nomeValue, calorias: caloriaValue, itens: itensSelecionados)

        delegate?.add(refeicao)

        navigationController?.popViewController(animated: true)
    }
}

