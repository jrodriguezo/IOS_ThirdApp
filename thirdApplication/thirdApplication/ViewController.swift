//
//  ViewController.swift
//  thirdApplication
//
//  Created by g838 DIT UPM on 19/10/18.
//  Copyright © 2018 g838 DIT UPM. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //la quiero que no haya valor
    var myBirthdate: Date?
    var myLove: Date?
    var fechaActual: Date?
    //para saber tu media naranja
    var yearLove: Int?
    var monthLove: Int?
    var dayLove: Int?
    
    var yearBirthdate: Int?
    var monthBirthdate: Int?
    var dayBirthdate: Int?
    
    var yearFechaActual: Int?
    var monthFechaActual: Int?
    var dayFechaActual: Int?
    
    var alertController: UIAlertController?

    
    
    @IBOutlet weak var labelMyLove: UILabel!
    @IBOutlet weak var labelMyBirthdate: UILabel!
    @IBOutlet weak var selectBirthdate: UIButton!
    @IBOutlet weak var selectLove: UIButton!
    @IBOutlet weak var myHalfOrangePartyText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selectBirthdate.layer.cornerRadius = 10
        selectLove.layer.cornerRadius = 10
        
        updateBLabel()
        updateLLabel()
        
    }
    
    
    
    
    private func updateBLabel(){
     
        
        if let bd = myBirthdate {
            
            //para cambiar el formato de la fecha
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long  //ni mucho ni poco
            dateFormatter.timeStyle = .none     //no pondrá la hora
            
            //let date = Date(timeIntervalSinceReferenceDate: 118800)

            //segun tengamos nosotros el idioma
            dateFormatter.locale = Locale(identifier: "en_US")
            let bdBeautiful = dateFormatter.string(from: bd)
            
        
            labelMyBirthdate.text = "  I was born in \(bdBeautiful)"
            
            dateFormatter.dateFormat = "yyyy"
            yearBirthdate = Int(dateFormatter.string(from: bd))
            dateFormatter.dateFormat = "MM"
            monthBirthdate = Int(dateFormatter.string(from: bd))
            dateFormatter.dateFormat = "dd"
            dayBirthdate = Int(dateFormatter.string(from: bd))
        }else{
            labelMyBirthdate.text = "  I dont know when I was born"
        }
        
    }

    
    private func updateLLabel(){
        
        if let ld = myLove {
            
            //para cambiar el formato de la fecha
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long  //ni mucho ni poco
            dateFormatter.timeStyle = .none     //no pondrá la hora
            
            //let date = Date(timeIntervalSinceReferenceDate: 118800)
            
            //segun tengamos nosotros el idioma
            dateFormatter.locale = Locale(identifier: "en_US")
            let ldBeautiful = dateFormatter.string(from: ld)
            
            
            labelMyLove.text = "  I fell in love in \(ldBeautiful)"
            dateFormatter.dateFormat = "yyyy"
            yearLove = Int(dateFormatter.string(from: ld))
            dateFormatter.dateFormat = "MM"
            monthLove = Int(dateFormatter.string(from: ld))
            dateFormatter.dateFormat = "dd"
            dayLove = Int(dateFormatter.string(from: ld))
        }else{
            labelMyLove.text = "  I dont know when I felt in love"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (yearBirthdate == nil || yearLove == nil){
            return
        } else {
            
            if( (yearBirthdate! > yearLove!) ||
                (yearBirthdate! == yearLove! && monthBirthdate! > monthLove!) ||
                (yearBirthdate! == yearLove! && monthBirthdate! == monthLove! && dayBirthdate! > dayLove! ) ){
                
                let alertController = UIAlertController(title: "ERROR", message: "It's weird to get in love before you born", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                present(alertController, animated: true, completion: nil)
                
            }
        }
    }
    
    
    
    
    
    func miMediaNaranja(){
    
        
        if yearBirthdate == nil || yearLove == nil{
            return
        }
        if( (yearBirthdate! > yearLove!) ||
            (yearBirthdate! == yearLove! && monthBirthdate! > monthLove!) ||
            (yearBirthdate! == yearLove! && monthBirthdate! == monthLove! && dayBirthdate! > dayLove! ) ){

            myHalfOrangePartyText.text = "You can't do that! Check out your dates"
            myHalfOrangePartyText.numberOfLines = 0

        }else{
        
        if( myBirthdate != nil && myLove != nil ){
                let calendario = Calendar.current
                let birthDate = calendario.startOfDay(for: myBirthdate!)
                let loveDate = calendario.startOfDay(for: myLove!)
                let days = Set<Calendar.Component>([.day])
                let numeroDeDias = calendario.dateComponents(days, from: birthDate, to: loveDate)
                let resultado = calendario.date(byAdding: .day, value: numeroDeDias.day!, to:myLove!)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-YYYY"
                myHalfOrangePartyText.text = "You have to celebrate your  Half Orange Party the " + dateFormatter.string(from: resultado!)
                myHalfOrangePartyText.numberOfLines = 0
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /*
        fechaActual = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long  //ni mucho ni poco
        dateFormatter.timeStyle = .none     //no pondrá la hora
        
        dateFormatter.dateFormat = "yyyy"
        yearFechaActual = Int(dateFormatter.string(from: fechaActual!))
        dateFormatter.dateFormat = "MM"
        monthFechaActual = Int(dateFormatter.string(from: fechaActual!))
        dateFormatter.dateFormat = "dd"
        dayFechaActual = Int(dateFormatter.string(from: fechaActual!))
        */
        
        if segue.identifier == "SelectBirthdate"{
            if let bvc = segue.destination as? SecondViewController{
                
                if let b = myBirthdate {
                    bvc.birthdate = b
                }
                bvc.cb = { (date:Date) -> () in
                    self.myBirthdate = date
                    self.updateBLabel()
                }
                
            }
        }
        
        if segue.identifier == "SelectLove"{
            if let lvc = segue.destination as? ThirdViewController{
                
                if let l = myLove{
                    lvc.loveDate = l
                }
                lvc.cb = { (date:Date) -> () in
                    self.myLove = date
                    self.updateLLabel()
                }
            }
        }
    }

    
    //hacemos un unwind, el UIStoryboardSegue es el tipo de las flechas
    @IBAction func mainPage(_ segue: UIStoryboardSegue){
        //aqui vuelvo a la primera pantalla
        if segue.identifier == "SelectBirthdateOkey"{
            if let bvc = segue.source as? SecondViewController {
                //cojo lo que haya en su atributo
                myBirthdate = bvc.birthdate
                updateBLabel() //tengo que actualizar la label
                miMediaNaranja()
            }
            
        }else if segue.identifier == "SelectBirthdateCancel"{
            
        }
        
        if segue.identifier == "SelectLoveOkey"{
            if let lvc = segue.source as? ThirdViewController {
                
                myLove = lvc.loveDate
                updateLLabel()
                miMediaNaranja()
                
            }
 
            
       }else if segue.identifier == "SelectLoveCancel"{
                
                
            }
        
        }
    }



