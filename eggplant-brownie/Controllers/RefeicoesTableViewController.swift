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
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        //Returns a URL by appending the specified path component to self.
        let caminho = diretorio.appendingPathComponent("refeicao")
        do {
            guard let caminho = recuperaCaminho() else { return }
            let data = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Refeicao> else { return }
            refeicoes = refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recuperaCaminho(path: String = "refeicao") -> URL? {
        // returns a directory to be used to persist data
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent(path)
        return caminho
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
        
        guard let caminho = recuperaCaminho() else { return }
        do {
            // NSKeyedArchiver requires the use of a try that should be invoked inside a do catch block
            let data = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try data.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }

    //  se prepara antes de seguir para o prox view controller a ser apresentado
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
    }
}
