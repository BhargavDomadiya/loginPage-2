//
//  forgotPasswordViewController.swift
//  loginPage
//
//  Created by R93 on 26/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var ResatePasswordButton: UIButton!
    @IBOutlet weak var oldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ResatePasswordButton.layer.masksToBounds = true
        ResatePasswordButton.layer.cornerRadius = 25
    }

    @IBAction func resetPasswordActionButton(_ sender: UIButton) {
        if newPassword.text == "" || confirmPassword.text == "" {
            displayValidation(massage: "enter valid password")
        }else if confirmPassword.text != newPassword.text {
           displayValidation(massage: "password are not same")
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SignInViewController: SignInViewController = storyBoard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(SignInViewController, animated: true)
        
        }
    private func displayValidation(massage: String) {
        
        let alert: UIAlertController = UIAlertController(title: "Error", message: massage, preferredStyle: .alert)
        let okButton: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { button in }
        let cancelButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        present(alert, animated: true, completion: nil)
    }
    
    func setCornerRadius(view: UIView?, cornerRadius: CGFloat)
    {
        view?.layer.cornerRadius = cornerRadius
        view?.layer.masksToBounds = true
    }
}
