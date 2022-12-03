//
//  ViewController.swift
//  SuperKahramanKitabi
//
//  Created by Emir on 25.10.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let secondVC = DetailsViewController()

    @IBOutlet weak var tableView: UITableView!
    
    var superHeroNames = [String]()
    var superHeroImageNames = [String]()
    //var selectIndex: Int? //Benim yöntemim
    var selectHeroNames: String?
    var selectHeroImageNames: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        superHeroNames.append("Batman")
        superHeroNames.append("Spiderman")
        superHeroNames.append("Ironman")
        superHeroNames.append("Superman")
        
        superHeroImageNames.append("batman")
        superHeroImageNames.append("spiderman")
        superHeroImageNames.append("ironman")
        superHeroImageNames.append("superman")
    }
    
    //numberOfRowsInSection -> kaç tane row olacak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superHeroNames.count
    }
     // cellForRow atIndexPath -> hücrenin içerisinde neler gösterilecek
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superHeroImageNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superHeroNames.remove(at: indexPath.row)
            superHeroImageNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //selectIndex = indexPath.row //Benim yöntemim
        selectHeroNames = superHeroNames[indexPath.row]
        selectHeroImageNames = superHeroImageNames[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            //destinationVC.heroNames = superHeroNames[selectIndex!] //Benim yöntemim
            //destinationVC.heroImageNames = superHeroImageNames[selectIndex!] //Benim yöntemim
            destinationVC.heroNames = selectHeroNames
            destinationVC.heroImageNames = selectHeroImageNames
        }
    }
}
