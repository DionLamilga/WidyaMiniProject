//
//  ViewController.swift
//  WidyaMiniProject
//
//  Created by Dion Lamilga on 11/02/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var usernameTxt: UITextField!
    
    var dataSiswa = Datas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func gotoRegister(_ sender: Any) {
        let modalstoryboard = UIStoryboard(name: "Register", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "regis") as! RegisterViewController
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: true)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        if passwordTxt.text == "admin" && usernameTxt.text == "admin"{
            
            gotoAdmin()
            
        } else {
            NetworkService.Login(username: usernameTxt.text ?? "", password: passwordTxt.text ?? "") { data in
                self.dataSiswa = data
                self.gotoJurusan()
            }
        }
    }
    
    func gotoJurusan(){
        let modalstoryboard = UIStoryboard(name: "PilihJurusan", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "jurusan") as! PilihJurusanViewController
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.dataSiswa = dataSiswa
        self.present(vc, animated: true)
    }
    
    func gotoAdmin(){
        let modalstoryboard = UIStoryboard(name: "Admin", bundle: nil)
        let vc = modalstoryboard.instantiateViewController(identifier: "admin") as! AdminViewController
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: true)
    }
}


extension ViewController: UITextViewDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
