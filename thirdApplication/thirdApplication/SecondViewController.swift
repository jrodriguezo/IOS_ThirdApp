//
//  SecondViewController.swift
//  thirdApplication
//
//  Created by g838 DIT UPM on 19/10/18.
//  Copyright © 2018 g838 DIT UPM. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController{
    
    var birthdate = Date()
    var cb: ((Date)-> ())?
    var birthdateP: Date?
    
    //primer selector
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //le asigno inicialmente la fecha actual
        birthdatePicker.date = birthdate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SelectBirthdateOkey"{
            if birthdatePicker.date > Date(){
                let alert = UIAlertController(title: "ERROR",
                                              message: "You and I know that you didn't be born that day",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok",
                                              style: .default))
                present(alert, animated: true)
                return false
            }
            
        }
        birthdateP = birthdatePicker.date
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectBirthdateOkey"{
            //lo que haya seleccionado
            birthdate = birthdatePicker.date
            
            cb?(birthdatePicker.date)
            
        }else if segue.identifier == "SelectBirthdateCancel"{
            //simplemente vuelvo
        }
    }
}
