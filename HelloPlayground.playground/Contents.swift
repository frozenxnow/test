import Cocoa




class One {
    struct Two {
        enum Three {
            case a
            
            class Four {
                
            }
        }
    }
    var a = Two()
}


let two: One.Two = One.Two()

let four: One.Two.Three.Four = One.Two.Three.Four()

let caseA: One.Two.Three

