//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 19/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController?

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var caloriaTextField: UITextField?

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
        
        let refeicao = Refeicao(nome: nomeValue, calorias: caloriaValue)

        tableViewController?.add(refeicao)

        navigationController?.popViewController(animated: true)
    }
}

