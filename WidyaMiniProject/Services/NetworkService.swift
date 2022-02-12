//
//  NetworkService.swift
//  WidyaMiniProject
//
//  Created by Dion Lamilga on 12/02/22.
//

import Foundation
import Alamofire

class NetworkService{
    
    static func CreatData(username: String,
                          password: String,
                          email: String,
                          name: String,
                          phone: String,
                          foto: String,
                          alamat: String,
                          sekolah_asal: String,
                          nama_ortu: String,
                          jurusan: String,
                          succesComplitionHandler: @escaping (Bool) -> Void){
        
        let URL = "http://192.168.1.10/MiniProject/v1/register.php"
        
        let datas: Parameters=[
            "username": username,
            "password": password,
            "email": email,
            "name": name,
            "phone": phone,
            "foto": foto,
            "alamat": alamat,
            "sekolah_asal": sekolah_asal,
            "nama_ortu": nama_ortu,
            "jurusan": jurusan
        ]
        
        Alamofire.request(URL, method: .post, parameters: datas).responseJSON{response in
            
            if let result = response.result.value{
                let jsonData = result as! NSDictionary
                print(jsonData.value(forKey: "message") ?? "")
            }
            succesComplitionHandler(true)
        }
    }
    
    static func Login(username: String,
                      password: String,
                      succesComplitionHandler: @escaping (Datas) -> Void){
        let URL = "http://localhost/MiniProject/v1/login.php"
        
        let datas: Parameters=[
            "username": username,
            "password": password,
        ]
        
        Alamofire.request(URL, method: .post, parameters: datas).responseJSON{response in
            if let result = response.result.value{
                let jsonData = result as! NSDictionary
                print(jsonData.value(forKey: "message") ?? "")
                
                if(!(jsonData.value(forKey: "error") as! Bool)){
                    
                    let user = jsonData.value(forKey: "user") as! NSDictionary
                    
                    let userId = user.value(forKey: "id") as! Int
                    let userUsername = user.value(forKey: "username") as! String
                    let userPassword = user.value(forKey: "password") as! String
                    let userEmail = user.value(forKey: "email") as! String
                    let userName = user.value(forKey: "name") as! String
                    let userPhone = user.value(forKey: "phone") as! String
                    let userFoto = user.value(forKey: "foto") as! String
                    let userAlamat = user.value(forKey: "alamat") as! String
                    let userSekolahAsal = user.value(forKey: "sekolah_asal") as! String
                    let userNamaOrtu = user.value(forKey: "nama_ortu") as! String
                    let userJurusan = user.value(forKey: "jurusan") as! String
                    
                    let newData = Datas(id: userId, username: userUsername, password: userPassword, email: userEmail, name: userName, phone: userPhone, foto: userFoto, alamat: userAlamat, sekolah_asal: userSekolahAsal, nama_ortu: userNamaOrtu, jurusan: userJurusan)
                    
                    DispatchQueue.main.async {
                        succesComplitionHandler(newData)
                    }

                }else{
                    print("error")
                }
            }
        }
    }
}
