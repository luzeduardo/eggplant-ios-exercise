//
//  AdicionarViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 27/09/2022.
//

import UIKit

protocol AdicionaItemsDelegate {
    func add(_ item: Item)
}

class AdicionarViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var caloriasTextfield: UITextField!
    @IBOutlet weak var nomeTextfield: UITextField!

    // MARK: - Atributos
    var delegate: AdicionaItemsDelegate?

    init(delegate: AdicionaItemsDelegate) {
        //nibName nome da view que chama o Controller
        super.init(nibName: "AdicionarViewController", bundle: nil)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction

    @IBAction func adicionarItem(_ sender: Any) {
        guard let nomeValue = nomeTextfield.text, let calorias = caloriasTextfield.text else { return }
        guard let caloriasValue = Double(calorias) else { return }
        let item = Item(nome: nomeValue, calorias: caloriasValue)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
