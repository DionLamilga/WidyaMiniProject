//
//  RegisterViewController.swift
//  WidyaMiniProject
//
//  Created by Dion Lamilga on 12/02/22.
//

import UIKit

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var daftarBtn: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var telpText: UITextField!
    @IBOutlet weak var asalSekolahText: UITextField!
    @IBOutlet weak var alamatText: UITextField!
    @IBOutlet weak var ortuText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var chooseImg: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            chooseImg.image = image
            imagePicker.dismiss(animated: true, completion: nil)
            
        } else{
            print("error")
        }
    }
    
    @IBAction func dafterTapped(_ sender: Any) {
        NetworkService.CreatData(username: usernameText.text ?? "", password: passwordText.text ?? "", email: emailText.text ?? "", name: nameText.text ?? "", phone: telpText.text ?? "", foto: "test.png", alamat: alamatText.text ?? "", sekolah_asal: asalSekolahText.text ?? "", nama_ortu: ortuText.text ?? "", jurusan: "Not Yet") { status in
            
            if status{
                print("Hello")
                let modalstoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = modalstoryboard.instantiateViewController(identifier: "login") as! ViewController
                
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .flipHorizontal
                self.present(vc, animated: true)
            }
        }
    }
    
    @IBAction func chooseImageTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
        
//        let imageData: Data = (chooseImg.image?.pngData())!
//        let imageStr: String = imageData.base64EncodedString()
//        let urlString: String = "imageStr=" + imageStr
    }
    
}

extension RegisterViewController: UITextViewDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
