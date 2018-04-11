import UIKit

@IBDesignable class MainRatingView: UIView {
    
    private struct Constants {
        static let total = 100
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 76
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    @IBInspectable var counter: Int = 50
    {
        didSet
        {
            if counter <=  Constants.total
            {
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
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        
        // 4
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - Constants.arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.total)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - Constants.halfOfLineWidth, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)

        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - Constants.arcWidth + Constants.halfOfLineWidth, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
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
