//
//  ViewController.swift
//  loginPage
//
//  Created by R93 on 22/12/22.
//

import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var forgatePassword: UIButton!
    @IBOutlet weak var enterPassword: UITextField!
    @IBOutlet weak var enterEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        signInButton.layer.masksToBounds = true
        signInButton.layer.cornerRadius = 25
    }
    
    @IBAction func signInButtonAction(_ sender: UIButton) {
        
        print("enter the valide password")
        if enterEmail.text == "" || enterPassword.text == "" {
            displayValidation(massage: "enter valid email")
        }else if enterEmail.text?.count ?? 0 < 3 {
            displayValidation(massage: "Enter valid email")
        }else if enterPassword.text?.count ?? 0 < 8 {
            displayValidation(massage: "Enter valide Password")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainPageViewController: MainPageViewController = storyBoard.instantiateViewController(withIdentifier: "MainPageViewController") as! MainPageViewController
        self.navigationController?.pushViewController(MainPageViewController, animated: true)
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
    
    @IBAction func forgotPasswordButton(_ sender: UIButton) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ForgotPasswordViewController: ForgotPasswordViewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        navigationController?.pushViewController(ForgotPasswordViewController, animated: true)
    }
    
    @IBAction func jointNowAction(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let JoinViewController: JoinViewController = storyBoard.instantiateViewController(withIdentifier: "JoinViewController") as! JoinViewController
        navigationController?.pushViewController(JoinViewController, animated: true)
    }
}

