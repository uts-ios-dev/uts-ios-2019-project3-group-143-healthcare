import UIKit
import FirebaseAuth
import FirebaseAnalytics

class MainViewController: UIViewController {

    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLoggedUser()
        changeLayout()
        self.navigationItem.title = "Health Care"
    }
    
    func changeLayout(){
        bannerImageView.image = UIImage(named:"banner")
        logoImageView.image = UIImage(named: "logo")
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.masksToBounds = true
    }
    
    func checkLoggedUser(){
        if Auth.auth().currentUser?.uid != nil{
            //let uid = Auth.auth().currentUser?.uid
            let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController")
            self.navigationController?.pushViewController(homeViewController!, animated: false)
        }
    }
    
    @IBAction func loginView(_ sender: UIButton) {
        performSegue(withIdentifier: "loginView", sender: self)
    }
    
    @IBAction func registerView(_ sender: UIButton) {
        performSegue(withIdentifier: "registerView", sender: self)
    }
}

