//
//  joinViewController.swift
//  loginPage
//
//  Created by R93 on 26/12/22.
//

import UIKit

class JoinViewController: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        if firstName.text == "" && lastName.text == "" && password.text == ""{
            displayValidation(massage: "ENTER ALL IMFORMATION")
        }else if lastName.text == "" && password.text == "" {
            displayValidation(massage: "ENTER LASTNAME AND PASSWORD")
        }else if  firstName.text == "" && lastName.text == "" {
            displayValidation(massage: "ENTER LASTNAME AND FIRSTNAME")
        }else if firstName.text == "" && password.text == "" {
            displayValidation(massage: "ENTER FIRSTNAME AND PASSWORD")
        }else if firstName.text == "" {
            displayValidation(massage: "enter First Name")
        }else if lastName.text == "" {
            displayValidation(massage: "Enter Last Name")
        }else if password.text == "" {
            displayValidation(massage: "Enter Password")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainPageViewController: MainPageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        navigationController?.pushViewController(MainPageViewController, animated: true)
    }
    private func displayValidation(massage: String) {
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "OK", style: .default) { button in }
        let cancelButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    
    func setCornerRadius(view: UIView?, cornerRadius: CGFloat) {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.masksToBounds = true
    }
}
