//
//  UsersViewController.swift
//  DMNetworkingIntro
//
//  Created by David Ruvinskiy on 4/10/23.
//

import UIKit

/**
 1. Create the user interface. See the provided screenshot for how the UI should look.
 2. Follow the instructions in the `User` file.
 3. Follow the instructions in the `NetworkManager` file.
 */
class UsersViewController: UIViewController {
    func usersRetrieved(data: [User]) {
        users = data
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
    

    /**
     4. Create a variable called `users` and set it to an empty array of `User` objects.
     */
    
    var users = [User]()
    
    /**
     5. Connect the UITableView to the code. Create a function called `configureTableView` that configures the table view. You may find the `Constants` file helpful. Make sure to call the function in the appropriate spot.
     */
    @IBOutlet weak var usersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getUsers()
    }
    
    func configureTableView() {
        usersTableView.dataSource = self
    }
    
    /**
     6.1 Set the `NetworkManager`'s delegate property to the `UsersViewController`. Have the `UsersViewController` conform to the `NetworkManagerDelegate` protocol. In the `usersRetrieved` function, assign the `users` property to the array we got back from the API and call `reloadData` on the table view.
     */
//    func getUsers() {
//        NetworkManager.shared.delegate = self
//        NetworkManager.shared.getUsers()
//    }
//}

//    3.2 Add a function called presentAlert to the UsersViewController that accepts a DMError and presents a UIAlertController with that error. Call presentError if there's a failure.

    
    func presentAlert(error: DMError){
        DispatchQueue.main.async {
            let errorAlert = UIAlertController(title: "Error", message: error.rawValue, preferredStyle: .alert)
            self.present(errorAlert, animated: true)
        }
    }
    
    
    func getUsers() {
        NetworkManager.shared.getUsers {result in
            switch result {
            case .success(let users):
                self.usersRetrieved(data: users)
            case .failure(let error):
                self.presentAlert(error: error)
            }
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userReuseID, for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = String(users[indexPath.row].firstName)
        configuration.secondaryText = String(users[indexPath.row].email)
        
        cell.contentConfiguration = configuration
        return cell
    }
    
    
}
