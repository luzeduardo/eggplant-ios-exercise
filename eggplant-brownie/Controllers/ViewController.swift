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
    @IBOutlet weak var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    // MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaritem = UIBarButtonItem(title: "Adiciona Ingrediente", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaritem
    }

    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    @objc func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            let alerta = Alerta(viewController: self)
            alerta.exibe(titulo: "Desculpe", mensagem: "não foi possível atualizar a tabela!")
        }

        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
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
    
    func recuperaDiretorio(path: String = "itens") -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(path)
        return caminho
    }
    
    func recuperaRefeicaoForm() -> Refeicao? {
        guard let nomeRefeicao = nomeTextField?.text else {
            print("guard nomeRefeicao")
            Alerta(viewController: self).exibe(mensagem: "Erro ao ler campo nome refeição")
            return nil
        }
        
        guard let felicidadeRefeicao = felicidadeTextField?.text else {
            print("guard felicidadeRefeicao")
            Alerta(viewController: self).exibe(mensagem: "Erro ao ler campo felicidade")
            return nil
        }
        
        let nomeValue = nomeRefeicao
        let felicidade = Double(felicidadeRefeicao)
        
        guard let felicidadeValue = felicidade else {
            print("guard felicidadeRefeicao")
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeValue, felicidade: felicidadeValue, itens: itensSelecionados)
        return refeicao
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        let refeicao = recuperaRefeicaoForm()
        guard let refeicaoValue = refeicao else {
            Alerta(viewController: self).exibe(mensagem: "Erro ao ler dados do formulário")
            return
        }
        delegate?.add(refeicaoValue)

        navigationController?.popViewController(animated: true)
    }
}

