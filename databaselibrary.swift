
//
//  databaselibrary.swift
//  todolistSQLITE
//
//  Created by Student P_08 on 18/09/19.
//  Copyright © 2019 ankita. All rights reserved.
//

import Foundation

class databaselib
{
    var taskid = [String]()
    var taskname = [String]()
    static let obj = databaselib()
    func databasepath()->String
    {
        let dir = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true)
        let path = dir.first
        return path!+"mydatabase.sqlite"
    }
    func excuteQuery(query:String)->Bool
    {
        var sucess:Bool = false
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbpath = databasepath()
        if sqlite3_open(dbpath,&db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                if sqlite3_step(stmt) == SQLITE_DONE
                {
                    sucess = true
                }
                else{
                    print("error is step:\(sqlite3_errmsg(stmt!))")
               }
            }
                else{ print("error is prepare:\(sqlite3_errmsg(stmt!))")
                }
            }
        
        else{
            print("error in open:\(sqlite3_errmsg(stmt!))")
        }
        return sucess
        
    
}
func createtable()
{
    let createquery = "create table if not exists tasktable(taskid text , taskname text)"
    let issucess = excuteQuery(query: createquery)
    if issucess
    {
        print("table creation sucess")
    }
    else{
        print("table creation unsucess")
    }
}
    func selectall(query:String)
    {
        
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbpath = databasepath()
        if sqlite3_open(dbpath,&db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                 while sqlite3_step(stmt) == SQLITE_ROW
                {
                  
                    let tname = sqlite3_column_text(stmt, 1)
                    let tasname = String(cString: tname!)
                    taskname.append(tasname)
                    let tid = sqlite3_column_text(stmt, 0)
                    let tasid = String(cString: tid!)
                    taskid.append(tasid)
                }
                
            }
            else{ print("error is prepare:\(sqlite3_errmsg(stmt!))")
            }
        }
            
        else{
            print("error in open:\(sqlite3_errmsg(stmt!))")
        }
        
        
        
    }
    
        
        

    

}
