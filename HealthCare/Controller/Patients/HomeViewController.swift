import UIKit
import FirebaseDatabase
import Firebase

class HomeViewController: UIViewController{
//    var appointments:[Appointments] = []
    let red = Database.database().reference(withPath: "Appointment")
    @IBOutlet weak var tableView: UITableView!
    
    
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
       
//        let appointmentDetails = Appointments[doctorName:]
        
    }
    
    func checkLoggedUser(){
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
        else{
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("Appointment").childByAutoId().observeSingleEvent(of: .value, with: { (snapshot) in
                print("Hahahaha\(snapshot)")
            }, withCancel: nil)
        }
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
