//
//  AdicionarViewController.swift
//  eggplant-brownie
//
//  Created by eduardo.luz on 27/09/2022.
//

import UIKit

class AdicionarViewController: UIViewController {

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction


    @IBAction func adicionarItem(_ sender: Any) {
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
