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
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        let alertaAction = UIAlertAction(title: titulo, style: .cancel)
        let alertaControl = UIAlertController(title: "Ok", message: mensagem, preferredStyle: .alert)
        alertaControl.addAction(alertaAction)
        viewController.present(alertaControl, animated: true)
    }
}
