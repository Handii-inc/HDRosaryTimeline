import Foundation
import UIKit

class BasicSectionView: UIView, SectionView {
    //MARK:- Properties
    private unowned let colorPalette: SectionViewColorPalette
    private unowned let sizeManager: SectionViewSizeManager
    
    private let position: SectionPosition
    public var text: String? {
        get {
            return self.textLabel.text
        }
        set {
            self.textLabel.text = newValue
            return
        }
    }

    //MARK:- SubComponents
    private lazy var blur: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.layer.addSublayer(self.upperShadow)
        view.layer.addSublayer(self.dot)
        view.layer.addSublayer(self.lowerShadow)
        return view
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        return label
    }()
    
    //MARK:- Sub layers
    private lazy var dot: CALayer = {
        let layer = CALayer()
        self.colorPalette.coloring(dot: layer)
        return layer
    }()
    
    private lazy var upperShadow: CALayer = {
        let layer = CALayer()
        self.colorPalette.coloring(shadow: layer)
        return layer
    }()
    
    private lazy var lowerShadow: CALayer = {
        let layer = CALayer()
        self.colorPalette.coloring(shadow: layer)
        return layer
    }()

    //MARK:- Initializer
    init(colorPalette: SectionViewColorPalette,
         sizeManager: SectionViewSizeManager,
         on position: SectionPosition)
    {
        self.colorPalette = colorPalette
        self.sizeManager = sizeManager
        self.position = position

        super.init(frame: .zero)

        self.addSubview(self.blur)
        self.addSubview(self.textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- UIView
    override func layoutSubviews() {
        super.layoutSubviews()
        self.colorPalette.coloring(titleLabel: self.textLabel, with: UIFont.systemFont(ofSize: self.sizeManager.titleFontSize))
        
        self.position.section(self)
        
        let diameterOfDot: CGFloat = self.frame.height * self.sizeManager.ratioOfDot
        self.upperShadow.frame = CGRect(x: self.sizeManager.gapFromLeft - self.sizeManager.thickness * 0.5,
                                        y: 0,
                                        width: self.sizeManager.thickness,
                                        height: (self.frame.height - diameterOfDot) * 0.5)
        self.dot.frame = CGRect(x: (self.upperShadow.frame.minX + self.upperShadow.frame.maxX) * 0.5 - diameterOfDot * 0.5,
                                y: self.upperShadow.frame.maxY,
                                width: diameterOfDot,
                                height: diameterOfDot)
        self.dot.cornerRadius = diameterOfDot * 0.5
        self.dot.borderWidth = self.sizeManager.thickness
        self.lowerShadow.frame = CGRect(x: self.upperShadow.frame.minX,
                                        y: self.dot.frame.maxY,
                                        width: self.sizeManager.thickness,
                                        height: (self.frame.height - self.dot.frame.maxY))
        self.blur.frame = CGRect(x: 0,
                                 y: 0,
                                 width: self.frame.width,
                                 height: self.frame.height)
        self.textLabel.frame = CGRect(x: self.upperShadow.frame.maxX + 20,
                                      y: 0,
                                      width: self.frame.width,
                                      height: self.frame.height)

        return
    }
    
    //MARK:- SectionView    
    func layout(on _: Top) {
        self.upperShadow.backgroundColor = UIColor.clear.cgColor
        return
    }
    
    func layout(on _: Middle) {
        return //do nothing
    }
    
    func layout(on _: Bottom) {
        self.lowerShadow.backgroundColor = UIColor.clear.cgColor
        return
    }
}
