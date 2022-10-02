//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 03/10/2022.
//

import Foundation
import UIKit

class RemoveRefeicaoViewController {

    let controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }

//        Escaping closures (@escaping) is a keyword used to indicate the life cycle of a closure that passes as an argument to the function. By prefix any closure argument with @escaping, you convey the message to the caller of a function that this closure can outlive (escape) the function call scope. Without escaping, a closure is non-escaping by default, and its lifecycle end along with function scope.
    func exibe(refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alert.addAction(botaoCancelar)

        let botaoRemover = UIAlertAction(title: "Deseja remover?", style: .destructive, handler: handler)
        alert.addAction(botaoRemover)
        controller.present(alert, animated: true)
    }
}
