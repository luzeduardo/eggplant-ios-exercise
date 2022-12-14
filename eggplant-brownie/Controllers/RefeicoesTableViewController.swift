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
    
    override func viewDidLoad() {
        guard let listaRefeicoes = RefeicaoDAO().recupera() else { return }
        refeicoes = listaRefeicoes
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        celula.addGestureRecognizer(longPress)
        return celula
    }

    @objc func longPress(gesture: UIGestureRecognizer) {
        if gesture.state == .began {
            //gesture.view returns the selected cell that we can cast to the correct type using as!
            let celula = gesture.view as! UITableViewCell
            // we must check it due to the method returns and optional
            guard let indexPath = tableView.indexPath(for: celula) else { return }

            let refeicaoIndex = indexPath.row
            let selectedRefeicao = refeicoes[refeicaoIndex]

            RemoveRefeicaoViewController(controller: self).exibe(refeicao: selectedRefeicao, handler: {
                // alerta is UIAlertAction required in the handler as param specified in UIAlertAction definition
                alerta in
                self.refeicoes.remove(at: refeicaoIndex)
                self.tableView.reloadData()
            })
        }
        if gesture.state == .ended {
            print("ended long press")
        }
        if gesture.state == .cancelled {
            print("cancelled long press")
        }
    }

    func add(_ refeicao: Refeicao) {
        print("Add \(refeicao.nome) chamado")
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDAO().save(refeicoes)
    }

    //  se prepara antes de seguir para o prox view controller a ser apresentado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
}
