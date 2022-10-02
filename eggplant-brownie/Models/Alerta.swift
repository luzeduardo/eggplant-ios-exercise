//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 02/10/2022.
//

import Foundation
import UIKit

class Alerta {
    
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func exibe() {
        let alertaAction = UIAlertAction(title: "ok", style: .cancel)
        let alertaControl = UIAlertController(title: "Desculpe", message: "não foi possível atualizar a tabela!", preferredStyle: .alert)
        alertaControl.addAction(alertaAction)
        viewController.present(alertaControl, animated: true)
    }
}
