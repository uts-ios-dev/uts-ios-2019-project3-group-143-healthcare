import UIKit
import FirebaseDatabase
import Firebase

class RegistrationViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Register"
        
    }
    
    func addUser(){
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func registerPage(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){autoResult, error in
            if(autoResult != nil){
                self.performSegue(withIdentifier: "registerHome", sender: self)
            }
            else{
                let title = "Error"
                var message = "Error: + \(error!)"
                if(self.emailTextField.text! == ""){
                    message = "Please fill in your email address"
                }
                else if(self.passwordTextField.text! == ""){
                    message = "Please fill in your password"
                }
                
                let okTitle = "Dismiss"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let okButton = UIAlertAction(title: okTitle, style: .cancel, handler: nil)
                alert.addAction(okButton)
                
                self.present(alert,animated: true, completion: nil)            }
        }
        
    }
    
}
