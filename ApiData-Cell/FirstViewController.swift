//
//  FirstViewController.swift
//  ApiData-Cell
//
//  Created by Edgar Sargsyan on 08.07.23.
//

import UIKit


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func action(_ sender: Any) {
        showLoadingIndicator()
        fetchDataAndPresentViewController()
    }
    
    func showLoadingIndicator() {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func hideLoadingIndicator() {
        view.subviews.forEach { subview in
            if let activityIndicator = subview as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    func fetchDataAndPresentViewController() {
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: URL(string: url)!) { [weak self] data, response, error in
            guard let self = self, let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "")")
                DispatchQueue.main.async {
                    self!.hideLoadingIndicator()
                }
                return
            }
            
            do {
                let parsingData = try JSONDecoder().decode([ToDo].self, from: data)
                DispatchQueue.main.async {
                    self.hideLoadingIndicator()
                    self.presentViewController(with: parsingData)
                }
            } catch {
                print("Error parsing data: \(error)")
                DispatchQueue.main.async {
                    self.hideLoadingIndicator()
                }
            }
        }
        dataTask.resume()
    }
    
    func presentViewController(with data: [ToDo]) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.data = data
        navigationController?.pushViewController(viewController, animated: true)
    }
}




