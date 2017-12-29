import Foundation

protocol CellView: class {    
    func layout(on _ : Single)
    func layout(on _ : Top)
    func layout(on _ : Middle)
    func layout(on _ : Bottom)
    func layout(on _ : SingleOfLastSection)
    func layout(on _ : TopOfLastSection)
    func layout(on _ : MiddleOfLastSection)
    func layout(on _ : BottomOfLastSection)
}
