//
//  ViewController.swift
//  webServiceClima
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var capturaTexto: UITextField!
    
    
    @IBOutlet weak var labelClima: UILabel!
    var clima:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "deepblue.jpeg")!)
        
            }

    @IBAction func iniciarWebServiceCall(sender: UIButton) {
    
    //println("Mi Lugar: \(capturaTexto.text)")
    
    llamadaWebService()
    
    }
    
    func llamadaWebService(){
        //http://api.openweathermap.org/data/2.5/weather?q=madrid,es&lang=sp
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=\(capturaTexto.text)"+",es&lang=sp"
        
        let url = NSURL(string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
   
        
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in

            if(error != nil) {

                println(error.localizedDescription)
                
            }
            var nsdata:NSData = NSData(data: data)
            
            println(nsdata)
            
            self.recuperarClimaDeJson(nsdata)
            
            
            dispatch_async(dispatch_get_main_queue(), {  println(self.clima!); self.labelClima.text = self.clima!} )

        })

        task.resume()
        //blog swift
        
    }

    func recuperarClimaDeJson(nsdata:NSData){
        
        let jsonCompleto : AnyObject! = NSJSONSerialization.JSONObjectWithData( nsdata, options: NSJSONReadingOptions.MutableContainers, error: nil)
 
        
        println(jsonCompleto)
        
        let arregloJsonWeather = jsonCompleto["weather"]
  
        if let jsonArray = arregloJsonWeather as? NSArray{
            
     
            //Iterar por todo nuestro array de jsons de nuestra respuesta al servicio web.
            
            jsonArray.enumerateObjectsUsingBlock({ model, index, stop in
                
                self.clima = model["description"] as? String
                
              
            
            });
            
            
            
        }
        
        
        
    }
    

    
    
    
   

}

