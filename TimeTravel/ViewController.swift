//
//  ViewController.swift
//  TimeTravel
//
//  Created by James Campagno on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var planetName: UILabel!
    @IBOutlet weak var currentSpeed: UILabel!
    @IBOutlet weak var speedAlert: UILabel!
    
    @IBOutlet weak var mercuryButton: UIButton!
    @IBOutlet weak var venusButton: UIButton!
    @IBOutlet weak var earthButton: UIButton!
    @IBOutlet weak var marsButton: UIButton!
    @IBOutlet weak var jupiterButton: UIButton!
    @IBOutlet weak var saturnButton: UIButton!
    @IBOutlet weak var uranusButton: UIButton!
    @IBOutlet weak var neptuneButton: UIButton!
    
    @IBOutlet weak var noneButton: UIButton!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lightspeedButton: UIButton!
    
    var spaceShipX = SpaceShip(name: "Super", currentPlanet: .earth)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let spaceShipLocation = spaceShipX.currentPlanet
        planetName.text = spaceShipLocation.stringValue
    }
    
    
    @IBAction func speedAction(_ sender: UIButton) {
        
        switch sender.titleLabel!.text! {
        case "None" :
            currentSpeed.text = sender.titleLabel?.text
            return spaceShipX.speed = .none
        case "Slow" :
            currentSpeed.text = sender.titleLabel?.text
            return spaceShipX.speed = .slow
        case "Medium" :
            currentSpeed.text = sender.titleLabel?.text
            return spaceShipX.speed = .medium
        case "Fast" :
            currentSpeed.text = sender.titleLabel?.text
            return spaceShipX.speed = .fast
        case "LightSpeed" :
            currentSpeed.text = sender.titleLabel?.text
            return spaceShipX.speed = .lightSpeed
        default: break
        }
    }
    
    @IBAction func pickPlanet(_ sender: UIButton) {
        
        // (String, Speed)
        
        switch (sender.titleLabel!.text!, spaceShipX.speed) {
        case ("Venus", .fast):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Venus it is!"
            return spaceShipX.currentPlanet = .venus
        case ("Earth", .fast):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Earth? Really? Again? So boring, we live here!"
            return spaceShipX.currentPlanet = .earth
        case ("Mars", .lightSpeed):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Mars! Alo? Is someone else here?"
            return spaceShipX.currentPlanet = .mars
        case ("Jupiter", .slow):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Jupiter is so big. There is no way I'm walking this planet."
            return spaceShipX.currentPlanet = .jupiter
        case ("Saturn", .medium):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Saturn, I wonder if I can take 1 ring."
            return spaceShipX.currentPlanet = .saturn
        case ("Uranus", .slow):
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Uranus... This planet have a weird rhyme."
            return spaceShipX.currentPlanet = .uranus
        case ("neptune", .fast) :
            planetName.text = sender.titleLabel?.text
            speedAlert.text = "Neptune! This was a long trip and I'm hungry."
            return spaceShipX.currentPlanet = .neptune
        case ("Neptune", .lightSpeed):
            planetName.text = "Mars"
            speedAlert.text = "Mars? I though we point at Neptune. Is the GPS working?"
            return spaceShipX.currentPlanet = .mars
        case ("Venus", .lightSpeed):
            planetName.text = "Mars"
            speedAlert.text = "I always wanted to visit Venus... wait... this looks like Mars!"
            return spaceShipX.currentPlanet = .mars
        default:
            speedAlert.text = "I'm not moving! I'm enjoying too much!"
            print("Bad news, can't fly there!!!")
            print(spaceShipX.speed, spaceShipX.currentPlanet)
        }
    }
}

enum Speed : Double {
    case none = 0
    case slow = 50
    case medium = 150
    case fast = 1000
    case lightSpeed = 1000000
    
    
    init?(spaceSpeed: Double) {
        
        switch spaceSpeed {
        case 0 : self = .none
        case 0..<150 : self = .slow
        case 150..<1000 : self = .medium
        case 1000..<1000000 : self = .fast
        default: self = .lightSpeed
        }
        
        
    }
    
    var lightSpeed : Bool {
        if self == Speed.lightSpeed {
            return true
        } else {
            return false
        }
    }
    
    func isFaster(than speed: Speed) -> Bool {
        if self.rawValue > speed.rawValue {
            return true
        } else {
            return false
        }
    }
}

enum Weather {
    case cold
    case warm
    case hot
    case superDuperHot
}

enum Planet : Int {
    
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    var stringValue: String {
        switch self {
        case .mercury: return "Mercury"
        case .venus: return "Venus"
        case .earth: return "Earth"
        case .mars: return "Mars"
        case .jupiter: return "Jupiter"
        case .saturn: return "Saturn"
        case .uranus: return "Uranus"
        case .neptune: return "Neptune"
            
        }
    }
    
    
    var hasLife : Bool {
        if self == Planet.mars || self == Planet.earth {
            return true
        } else {
            return false
        }
        
    }
    
    var weather : Weather {
        
        switch self {
        case .mercury : return .superDuperHot
        case .venus : return .hot
        case .earth : return .warm
        case .mars : return .warm
        case .jupiter : return .cold
        case .saturn : return .cold
        case .uranus : return .cold
        case .neptune : return .cold
        }
    }
}

class SpaceShip {
    
    var name: String
    var speed: Speed = .none
    var currentPlanet : Planet
    
    var description : String { return "cool" }
    
    init(name: String, currentPlanet: Planet) {
        self.name = name
        self.currentPlanet = currentPlanet
    }
    
    
    
    func timeTravel() -> Bool {
        if self.speed.rawValue == 1000000 {
            return true
        }
        return false
    }
    
    func isFaster(than spaceship:SpaceShip) -> Bool {
        if self.speed.rawValue > spaceship.speed.rawValue {
            return true
        } else {
            return false
        }
    }
    
    
    
    func travel(to planet: Planet) -> Bool {
        
        if self.speed == .fast {
            if planet == .venus || planet == .earth || planet == .neptune {
                self.currentPlanet = planet
                
                return true
            }
            return false
        }
        else if self.speed == .medium {
            if planet == .saturn {
                self.currentPlanet = planet
                return true
            }
            return false
        }
        else if self.speed == .slow {
            if planet == .jupiter || planet == .uranus {
                self.currentPlanet = planet
                return true
            }
            return false
        }
        else if self.speed == .lightSpeed {
            if planet == .mars {
                self.currentPlanet = planet
                return true
            }
            return false
        }
        return false
    }
}






