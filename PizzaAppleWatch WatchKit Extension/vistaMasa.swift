//
//  vistaMasa.swift
//  PizzaAppleWatch
//
//  Created by Fernando Renteria on 18/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import WatchKit
import Foundation

protocol PizzaDelegate {
    func pizzaDidFinish(context:AnyObject?)
}

class vistaMasa: WKInterfaceController,PizzaQuesoDelegate {
    
    // Objeto Pizza
    var pizzaMasa: Pizza = Pizza()
    // Delegate.
    var delegate:PizzaDelegate! = nil
    // Mapa de masa.
    var pizzaMasaMap = [Int: String]()
    // Picker.
    @IBOutlet var masaPicker: WKInterfacePicker!
    
    @IBOutlet var pizzaMasaLbl: WKInterfaceLabel!
    
    @IBAction func agregaMasaPizza(value: Int) {
        pizzaMasa.masa = String(pizzaMasaMap[value]!)
        pizzaMasaLbl.setText("Masa: \(pizzaMasa.masa)")
        print(pizzaMasa.imprimePedido())
        let newContext:AnyObject? = pizzaMasa
        delegate.pizzaDidFinish(newContext)
    }
    
    @IBAction func agregarQueso() {
        if (pizzaMasa.masa == "") {
            pizzaMasa.masa = String(pizzaMasaMap[0]!)
        }
        pizzaMasa.delegate = self
        pushControllerWithName("OpQueso", context: pizzaMasa)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        pizzaMasa = context as! Pizza
        
        pizzaMasaMap[0] = "Delgada"
        pizzaMasaMap[1] = "Crujiente"
        pizzaMasaMap[2] = "Gruesa"
        
        var masaPickerItems = [WKPickerItem]()
        for var i = 0; i < pizzaMasaMap.count; ++i {
            let pickerItem = WKPickerItem()
            pickerItem.title = pizzaMasaMap[i]
            pickerItem.caption = "Masa"
            masaPickerItems.append(pickerItem)
        }
        masaPicker.setItems(masaPickerItems)
    
        if (pizzaMasa.masa != "") {
            var indexForPicker :Int = 0
            for (masaKey, masaString) in pizzaMasaMap {
                if (masaString == pizzaMasa.masa) {
                    indexForPicker = masaKey
                }
            }
            masaPicker.setSelectedItemIndex(indexForPicker)
        }
        
        // Configure interface objects here.
        delegate = pizzaMasa.delegate as? PizzaDelegate
        
    }
    
    func pizzaQuesoDidFinish(context:AnyObject?){
       pizzaMasa = context as! Pizza
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
