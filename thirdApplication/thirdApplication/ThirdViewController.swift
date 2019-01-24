//
//  ThirdViewController.swift
//  thirdApplication
//
//  Created by g838 DIT UPM on 23/10/18./Users/g838/Desktop/thirdApplication/thirdApplication/ViewController.swift
//  Copyright © 2018 g838 DIT UPM. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController{

    var loveDate = Date()
    var cb: ((Date)-> ())?
    
    //primer selector
    @IBOutlet weak var lovePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //le asigno inicialmente la fecha actual
        lovePicker.date = loveDate
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SelectLoveOkey"{
            if lovePicker.date > Date(){
                let alert = UIAlertController(title: "ERROR",
                                              message: "You and I know that you didn't fall in love that day",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok",
                                              style: .default))
                present(alert, animated: true)
                return false
            }
            
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectLoveOkey"{
            //lo que haya seleccionado
            loveDate = lovePicker.date
            
            cb?(lovePicker.date)
            
        }else if segue.identifier == "SelectLoveCancel"{
            //simplemente vuelvo
        }
    }

}
