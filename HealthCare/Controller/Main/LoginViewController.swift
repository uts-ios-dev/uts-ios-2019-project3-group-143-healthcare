import UIKit
import FirebaseAuth
import FirebaseAnalytics


class LoginViewController: UIViewController{

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeLayout()
        self.hideKeyboard()
        self.navigationItem.title = "Login"
        
    }
    
    func changeLayout(){
        bannerImageView.image = UIImage(named:"banner")
        logoImageView.image = UIImage(named: "logo")
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.masksToBounds = true    }
    
    @IBAction func loginView(_ sender: UIButton) {
        
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if user != nil{
                    self.performSegue(withIdentifier: "loginHome", sender: self)
            }
            else{
                let title = "Error"
                var message = "Incorrect email or password"
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
                
                self.present(alert,animated: true, completion: nil)
                
            }
        }
        
    }
    
    
    @IBAction func resetPassword(_ sender: UIButton) {
        performSegue(withIdentifier: "resetPassword", sender: self)
    }
    
}
