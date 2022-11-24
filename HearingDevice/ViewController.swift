//
//  ViewController.swift
//  HearingDevice
//
//  Created by Meng Li on 2022/11/24.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    private var centralManager : CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }

    @IBAction func scan(_ sender: Any) {
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard advertisementData.keys.contains("kCBAdvDataLocalName") else {
            return
        }
        print(advertisementData)
    }
}
