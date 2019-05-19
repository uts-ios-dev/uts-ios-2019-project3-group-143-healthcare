import UIKit
import FirebaseDatabase
import Firebase

class HomeViewController: UIViewController{
//    var appointments:[Appointments] = []
    let appointmentData = Database.database().reference(withPath: "User")
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var patientName: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dashboard"
        self.navigationItem.hidesBackButton = true
        getAppointment()
        
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
    
    
    
    func getAppointment(){
                let userID = Auth.auth().currentUser?.uid
        appointmentData.child("User").child(userID!).child("AppointmentsDetails").observeSingleEvent(of: .value, with: {(snapshot) in
            let value = snapshot.value as? NSDictionary
            let doctorName = value?["DoctorName"] as? String ?? ""
            let appointmentTime = value?["Time"] as? String ?? ""
            
            print("\(doctorName) and \(appointmentTime)")
        })
        {
            (error) in
            print(error.localizedDescription)
        }
//        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//            let user = User(username: username)
//
//            // ...
//        }) { (error) in
//            print(error.localizedDescription)
//        }
    }
    
    @objc func handleLogout(){
        do{
            try Auth.auth().signOut()
        }
        catch let logout{
            print(logout)
        }
        performSegue(withIdentifier: "logoutPatient", sender: self)
    }

    @IBAction func bookAppointment(_ sender: UIButton) {
        
        performSegue(withIdentifier: "confirmAppointment", sender: self)
    }
    
    
    @IBAction func editProfile(_ sender: UIButton) {
        getAppointment()
        performSegue(withIdentifier: "editProfile", sender: self)
    }
    
    
    @IBAction func showHealthStatus(_ sender: UIButton) {
        performSegue(withIdentifier: "healthStatus", sender: self)
    }
    
    
 
    @IBAction func showHistory(_ sender: UIButton) {
        performSegue(withIdentifier: "patientHistory", sender: self)
    }
    
    @IBAction func cancelAppointments(_ sender: UIButton) {
        performSegue(withIdentifier: "cancelAppointment", sender: self)
    }
    
    @IBAction func logoutPatient(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
                performSegue(withIdentifier: "logoutPatient", sender: self)
        }
        catch{
            let alert = UIAlertController(title: "Error!", message: "Please check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert,animated: true,completion: nil)
        }
        
        
    }
    
}
