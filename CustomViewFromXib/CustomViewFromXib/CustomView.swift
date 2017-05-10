

import UIKit

@IBDesignable class CustomView: UIView {
    
    var view: UIView!
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBInspectable var image: UIImage? {
        get {
            return imageView.image
        }
        set(image) {
            imageView.image = image
        }
    }
    
    @IBInspectable var labelString: String? {
        get {
            return label.text
        }
        set(labelString) {
            label.text = labelString
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)
        
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
