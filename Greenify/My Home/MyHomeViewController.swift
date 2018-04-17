import UIKit

class MyHomeViewController: UIViewController {

    @IBOutlet weak var mainRatingView: MainRatingView!
    @IBOutlet weak var mainRating: UILabel!
    
    @IBOutlet weak var waterRatingView: WaterRatingView!
    @IBOutlet weak var waterRating: UILabel!
    
    
    @IBOutlet weak var energyRatingView: EnergyRatingView!
    @IBOutlet weak var energyRating: UILabel!
    
    
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var houseBio: UITextView!
    
    var homeStruct: HomeStruct!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let waterRatingValue = (homeStruct.getWaterRating())
        
        let energyRatingValue = (homeStruct.getEnergyRating())
        
        
        waterRatingView.counter = Int((waterRatingValue / 3) * 100)
        energyRatingView.counter = Int((energyRatingValue / 3) * 100)
        
        var mainRatingValue = (waterRatingValue / 6) + (energyRatingValue / 2)
        mainRatingValue = mainRatingValue / 2
        mainRatingValue = mainRatingValue * 100
        
        mainRatingView.counter = Int(mainRatingValue)
        
        
        addressLabel.text = homeStruct.getFullAddress()
        
        
        mainRating.text =  String(mainRatingView.counter)
        waterRating.text = String(waterRatingView.counter)
        energyRating.text = String(energyRatingView.counter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
