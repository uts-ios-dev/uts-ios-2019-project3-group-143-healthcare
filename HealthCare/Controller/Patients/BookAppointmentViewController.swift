import UIKit
import Firebase
import FirebaseDatabase

class BookAppointmentViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var appointment:DatabaseReference!
    
    var doctors:[String] = ["Atif Gill","Sharad Ghimire","Rohit Gurung"]
    @IBOutlet weak var doctorPicker: UIPickerView!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var datePickered: UIDatePicker!
    @IBOutlet weak var datePicked: UILabel!
    var doctorname:String = ""
    var appointTime:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Book Appointment"
        appointment = Database.database().reference().child("Appointment")
    }
    
    func addAppointment(){
        let key = appointment.childByAutoId().key
        let appointments = ["id":key,"Appointment Time":datePicked.text,"Doctor Name":doctorName.text]
        appointment.child(key!).setValue(appointments)
    }
    
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        let dateString = dateFormatter.string(from: datePickered.date)
        datePicked.text = dateString
        
    }
    
    @IBAction func bookAppointment(_ sender: UIButton) {
        addAppointment()
        performSegue(withIdentifier: "bookAppointment", sender: self)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return doctors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        doctorName.text = doctors[row]
        return doctors[row]
    }
  
}
