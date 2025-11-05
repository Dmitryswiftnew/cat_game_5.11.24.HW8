

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cycleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }


    override func viewDidAppear(_ animated: Bool) {
        cycleButton.frame = CGRect( // задаем размеры и начальные координаты для кружка
            x: 100,
            y: 100,
            width: 80,
            height: 80)
        cycleButton.backgroundColor = randomColor() // сразу меняем на рандомный цвет
        cycleButton.layer.cornerRadius = cycleButton.frame.height / 2 // делаем кнопку круглой
        view.addSubview(cycleButton) // добавляем кнопку на экран
 
    }
    
    @IBAction func jumpCycleButton(_ sender: UIButton) {
        cycleButton.backgroundColor = randomColor() // рандомный цвет при нажатии на кнопку
        jumpRandomPosition()

    }
    

   // MARK: Функция получения рандомного цвета
    
    func randomColor() -> UIColor {
           let r = CGFloat(arc4random()) / CGFloat(UInt32.max)
           let g = CGFloat(arc4random()) / CGFloat(UInt32.max)
           let b = CGFloat(arc4random()) / CGFloat(UInt32.max)
           return UIColor(red: r, green: g, blue: b, alpha: 1.0)
       }
    
    
    func jumpRandomPosition() {
        // MARK: чтоб не выходил кружок за границы экрана
        let maxDiapozonWidth = self.view.frame.width - cycleButton.frame.width // вычитаем ширина экрана - ширина кружка
        let maxDiapozonHeight = self.view.frame.height - cycleButton.frame.height // вычитаем высота экрана - высота кружка
        
//        let randomWidth = Int.random(in: 0...Int(maxDiapozonWidth))
//        let randomHeight = Int.random(in: 0...Int(maxDiapozonHeight)) функции получения рандомного числа до диапозона
    
        let randomX = CGFloat.random(in: 0...maxDiapozonWidth) // тоже самое
        let randomY = CGFloat.random(in: 0...maxDiapozonHeight)
        
//        // MARK: Меняем случайные координаты
//        cycleButton.frame.origin.x = randomX
//        cycleButton.frame.origin.y = randomY
        
        
        cycleButton.frame.origin = CGPoint(x: randomX, y: randomY) // рандомная точка в которой появится кружок
        
    }
    
    
}

