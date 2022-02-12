//
//  PilihJurusanViewController.swift
//  WidyaMiniProject
//
//  Created by Dion Lamilga on 12/02/22.
//

import UIKit
import MessageUI

class PilihJurusanViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var submitTxt: UIButton!
    @IBOutlet weak var jurusanTxt: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    
    var dataSiswa = Datas()
    
    let jurusan = ["MIA", "IIS", "IB"]
    let jurusanPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = ("Hi, \(dataSiswa.name ?? "")")
        
        jurusanPicker.delegate = self
        jurusanPicker.delegate = self
        
        jurusanTxt.inputView = jurusanPicker
        // Do any additional setup after loading the view.
    }
    
    func sendEmail(recipient: [String], text: String){
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(recipient)
            mail.setMessageBody(text, isHTML: true)
            present(mail, animated: true, completion: nil)
        } else {
            print("error")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        showAlert()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Sukses", message: "Pendaftaran teleh berhasil", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmis", style: .cancel, handler: { action in
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }))
        
        present(alert, animated: true)
    }
}

extension PilihJurusanViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        jurusan.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        jurusan[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        jurusanTxt.text = jurusan[row]
        jurusanTxt.resignFirstResponder()
    }
    
}
