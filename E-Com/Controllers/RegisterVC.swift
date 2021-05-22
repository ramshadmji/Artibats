//
//  RegisterVC.swift
//  E-Com
//
//  Created by Mohammed Ramshad K on 21/05/21.
//

import UIKit
import Firebase
class RegisterVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        guard let password = passwordTextField.text else {
            return
        }
        if textField == confirmPasswordTextField{
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
        }else{
            if password.isEmpty{
                passCheckImg.isHidden = true
                confirmPassCheckImg.isHidden = true
                confirmPasswordTextField.text = ""
            }
        }
        
        if passwordTextField.text == confirmPasswordTextField.text{
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        }else{
            passCheckImg.image = UIImage(named: AppImages.RedCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.RedCheck)
        }
    }
    @IBAction func registerAction(_ sender: Any) {
        guard let email = emailTextField.text, email.isNotEmpty,
              let username = usernameTextField.text, username.isNotEmpty,
              let password = passwordTextField.text, password.isNotEmpty else { return }
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            if let error = error{
                debugPrint(error)
                return
            }
            self.activityIndicator.stopAnimating()
            guard let user = authResult?.user else {return}
            print("\(user) registered successfully")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
