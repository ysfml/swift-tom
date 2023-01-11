//
//  ViewController.swift
//  TomRoth
//
//  Created by Tom Roth on 05/01/2023.
//
//  Question 1 : fait
//  Question 2 : fait
//  Question 3 : fait
//  Question 4 : fait
//  Question 5 : fait
//  Question 6 : fait

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFiltered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wishCell", for: indexPath) as! TableViewCell
        
        let row = indexPath.row
        
        cell.nomCadeau.text = dataFiltered[row].name
        cell.prixCadeau.text = String(dataFiltered[row].prix)
        
        return cell
    }

    let gifts = ["Console PS5", "Joystick", "Fifa 23", "iPhone 14", "Coque iPhone ", "Protection iPhone ", "Magic Mouse", "Webcam", "Mac book Pro", "Rubik Cube", "Sac de transport Ordinateur", "Boite de thè", "Lot de crayons", "Livre Les échecs pour les nuls", "Pull moche de Noel", "Casque VR"]

    let prices = [499.00, 69.00, 58.99, 1290.00, 29.99, 9.99, 50.00, 84.90, 2000.00, 20.00, 59.99, 15.24, 2.00, 25.00, 15.00, 500.00]
    
    var data : [Gift] = []
    var dataFiltered : [Gift] = []
    
    @IBOutlet weak var wishTableView: UITableView!
    @IBOutlet weak var prixFiltreSlider: UISlider!
    @IBOutlet weak var prixFiltre: UILabel!
    
    @IBAction func sortButton(_ sender: Any) {
        dataFiltered = dataFiltered.sorted(by: { s1, s2 in s1.prix < s2.prix } )
        wishTableView.reloadData()
    }
    
    @IBAction func filterSlider(_ sender: Any) {
        prixFiltre.text = String(prixFiltreSlider.value)
        dataFiltered = data.filter { $0.prix <= Double(prixFiltreSlider.value) }
        wishTableView.reloadData()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        dataFiltered = data;
        wishTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...15 {
            let gift = Gift(name: gifts[i], prix: prices[i])
            data.append(gift)
        }
        print(data)
        wishTableView.dataSource = self
    }


}

