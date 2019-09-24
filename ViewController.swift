//
//  ViewController.swift
//  todolistSQLITE
//
//  Created by Student P_08 on 18/09/19.
//  Copyright © 2019 ankita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func baritem(_ sender: UIBarButtonItem) {
        let next = storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        navigationController?.pushViewController(next, animated: true)
    }

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

