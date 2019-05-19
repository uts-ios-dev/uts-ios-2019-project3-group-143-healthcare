import UIKit
import Firebase
import FirebaseDatabase

class CancelAppointmentViewController: UIViewController {

    @IBOutlet weak var patientsName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Cancel Appointments"
//        getPatientsName()
    }
    
    @IBAction func cancelAppointment(_ sender: UIButton) {
        performSegue(withIdentifier: "cancelAppointment", sender: self)
    }
    
    func getPatientsName(){
        let userName = (Auth.auth().currentUser?.displayName)!
        print("My name is \(userName)")
    }
    
}
