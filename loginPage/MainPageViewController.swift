//
//  secondViewController.swift
//  loginPage
//
//  Created by R93 on 07/03/34.
//

import UIKit
import WebKit

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    var arrUser: [Dictionary<String, AnyObject>] = []
    var arr: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    private func getUser(){
        guard let url = URL(string: "https://gorest.co.in/public/v2/todos") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){ data, response, error in
            guard let apidata = data else { return }
            do{
                let json = try JSONSerialization.jsonObject(with: apidata) as! [Dictionary<String, AnyObject>]
                self.arrUser = json
                DispatchQueue.main.async {
                    self.userTableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
  
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        
        let rowDictionary = arrUser[indexPath.row]
        cell.idLabel.text = "\(rowDictionary["id"]as! Int)"
        cell.userIdLabel.text = "\(rowDictionary["userId"]as! Int)"
        cell.titleLabel.text = "\(rowDictionary["title"]as! String)"
        cell.dueOnLabel.text = "\(rowDictionary["dueOn"]as! String)"
        cell.statusLabel.text = "\(rowDictionary["status"]as! String)"
        return cell
    }
    
}

class User{
    var id: Int
    var userId: Int
    var title: String
    var dueOn: String
    var status: String
    
    init( userDetails: Dictionary<String, AnyObject>) {
        id = userDetails["id"] as! Int
        userId = userDetails["user_id"] as! Int
        title = userDetails["title"] as! String
        dueOn = userDetails["due_on"] as! String
        status = userDetails["status"] as! String
    }
}

