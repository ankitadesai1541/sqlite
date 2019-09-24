//
//  nextViewController.swift
//  todolistSQLITE
//
//  Created by Student P_08 on 18/09/19.
//  Copyright © 2019 ankita. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    @IBOutlet weak var taskid: UITextField!
    @IBOutlet weak var taskname: UITextField!

    @IBAction func insert(_ sender: UIButton) {
        let insertquery = "insert into tasktable(taskid,taskname)values('\(taskid.text)','\(taskname.text)')"
        let isSucess = databaselib.obj.excuteQuery(query: insertquery)
        if isSucess
        {
            print("insert sucessful")
        }
        else{
            print("insert insucess")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
