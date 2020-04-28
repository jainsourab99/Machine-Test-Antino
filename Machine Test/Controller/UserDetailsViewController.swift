//
//  UserDetailsViewController.swift
//  Machine Test
//
//  Created by Sourabh Jain on 28/04/20.
//  Copyright © 2020 Sourabh Jain. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var userDetailsTableView: UITableView!
    
    let cellID = "UserDetailsTableViewCell"
    var detailsModel = UserModel()
    
    //  MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userDetailsTableView.delegate = self
        userDetailsTableView.dataSource = self
        let nibcell = UINib(nibName: cellID, bundle: nil)
        userDetailsTableView.register(nibcell, forCellReuseIdentifier: cellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  Call API Calling Function
        getDataFromAPI {
            self.userDetailsTableView.reloadData()
        }
        
    }
    //  MARK:- Get The Data from API
    
    func getDataFromAPI(completed: @escaping () -> ()) {
        guard let url = URL(string: "http://demo8716682.mockable.io/cardData") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                do {
                    self.detailsModel = try JSONDecoder().decode(UserModel.self, from: data!)
                        DispatchQueue.main.async {
                            completed()
                        }
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
        }.resume()
    }
}


extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? UserDetailsTableViewCell else {return UserDetailsTableViewCell()}
        let cellData = detailsModel[indexPath.row]
        cell.loadData(UserDetails: cellData)
        cell.contentView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        return cell
    }
    
    
}
