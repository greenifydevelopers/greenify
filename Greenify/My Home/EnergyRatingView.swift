import UIKit

@IBDesignable class EnergyRatingView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 100
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 40
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 14 {
        didSet {
            if counter <=  Constants.numberOfGlasses {
                //the view needs to be refreshed
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.red
    @IBInspectable var counterColor: UIColor = UIColor.red
    @IBInspectable var fillColor: UIColor = UIColor.red
    
    override func draw(_ rect: CGRect) {
        // 1
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        // 2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        // 3
        let startAngle: CGFloat = 4 * .pi / 5
        let endAngle: CGFloat = .pi / 5
        
        // 4
        let path = UIBezierPath(arcCenter: center,
                                radius: radius/2 - Constants.arcWidth/2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        
        // 5
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        
        //Draw the outline
        
        //1 - first calculate the difference between the two angles
        //ensuring it is positive
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        //then multiply out by the actual glasses drunk
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //2 - draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        //3 - draw the inner arc
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        if(counter < 33)
        {
            self.outlineColor = UIColor.red
            self.fillColor = UIColor.red
            fillColor.setFill()
            outlinePath.fill()
        }
        else if(counter >= 33 && counter < 66)
        {
            self.outlineColor = UIColor.yellow
            self.fillColor = UIColor.yellow
            fillColor.setFill()
            outlinePath.fill()
        }
        else
        {
            self.outlineColor = UIColor.green
            self.fillColor = UIColor.green
            fillColor.setFill()
            outlinePath.fill()
        }
        
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
    }
}
