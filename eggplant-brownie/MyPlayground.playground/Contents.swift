import UIKit

var greeting = "Hello, playground"


let calorias = [1,2,3,4,5]

for idx in 0...calorias.count - 1 {
    print(calorias[idx])
}



for cal in calorias {
    print(cal)
}


func printCalorias(calorias: Array<Int>) -> Int {
    var total: Int = 0
    for cal in calorias {
        total += cal
        print("Olá \(cal)")
    }
    return total
}

print(printCalorias(calorias: calorias))



class Country {
    var nome: String?
}

let numero = Int("5asd")

if let n = numero {
    print(n)
}
//print(numero)
var c1 = Country()
c1.nome = "Edu"
if let nome = c1.nome {
    print("if let \(nome.uppercased())")
}

class Refeicao {
    var nome: String
    var caloria: Double
    var itens: Array<Item> = []
    
    init(nome: String, caloria: Double) {
        self.nome = nome
        self.caloria = caloria
    }
    
    func show() {
        print("Comi \(self.nome) com \(self.caloria) calorias!")
    }
}


class Item {
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}

let arroz = Item(nome: "Arroz", calorias: 100)
let feijao = Item(nome: "Feijao", calorias: 200)

let ref:Refeicao = Refeicao(nome: "Pizza", caloria: 10.1)
ref.itens.append(arroz)
ref.itens.append(feijao)
print(ref.itens.first?.nome)
ref.show()





