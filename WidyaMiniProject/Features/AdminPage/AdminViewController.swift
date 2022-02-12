//
//  AdminViewController.swift
//  WidyaMiniProject
//
//  Created by Dion Lamilga on 12/02/22.
//

import UIKit

class AdminViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTable.delegate = self
        listTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Nama"
        cell.detailTextLabel?.text = "Nama Jurusan"
        return cell
    }
}
