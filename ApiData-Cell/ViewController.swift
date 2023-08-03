//
//  ViewController.swift
//  ApiData-Cell
//
//  Created by Edgar Sargsyan on 06.07.23.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    var data = [ToDo]()
    
 
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.darkGray
     
        super.viewDidLoad()
      
    }
}


 extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentToDo = data[indexPath.row]
        cell.textLabel?.text = currentToDo.title
       
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ColorViewController") as! ColorViewController
         
         vc.testResult = data[indexPath.row].completed
         vc.tLable = data[indexPath.row].title
         navigationController?.pushViewController(vc, animated: true)
         
     }
 }
