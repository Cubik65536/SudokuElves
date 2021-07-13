//
//  Vision.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import Vision
import VisionKit

extension CGRect {
    var absoluteCenter: CGPoint {
        return CGPoint(x: origin.x + width/2, y: origin.y + height/2)
    }
}

struct ValueData {
    let value: String
    let column: Int
    let row: Int
    
    init(value: String, column: Int, row: Int) {
        self.value = (1...9).map({String($0)}).contains(value) ? value : "1"
        self.column = column
        self.row = row
    }
}

final class ContentViewModel: NSObject, ObservableObject {
    var scannedData: [ValueData] = []
    var solvedData: [ValueData] = []
    var sudokuPlate: [[String]] = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                                  [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
    
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue",
                                                         qos: .userInitiated,
                                                         attributes: [],
                                                         autoreleaseFrequency: .workItem)
    
    @Published var errorMessage: String?
    @Published var imageArray: [UIImage] = []
    
    func processScannedData(_ scannedData: [ValueData]) {
        self.scannedData = scannedData
        var lastCell = [-1, -1]
        var i = 0
        while i < scannedData.count {
            let row = scannedData[i].row
            let col = scannedData[i].column
            if lastCell != [row, col] {
                sudokuPlate[row][col] = "\(scannedData[i].value)"
                lastCell = [row, col]
            }
            i += 1
        }
        print("sudokuPlate: \(sudokuPlate)")
    }
    
    func getDocumentCameraViewController() -> VNDocumentCameraViewController {
        let vc = VNDocumentCameraViewController()
        vc.delegate = self
        return vc
    }
    
    func removeImage(image: UIImage) {
        imageArray.removeAll{$0 == image}
    }
}


extension ContentViewModel: VNDocumentCameraViewControllerDelegate {
    
    func closedRangeForElementsCount(_ count: Int, reversedIndex: Bool = false) -> [(ClosedRange<CGFloat>, Int)] {
        var ranges: [(ClosedRange<CGFloat>, Int)] = []
        
        let absoluteLength: CGFloat = 1.0/CGFloat(count);
        for i in 0..<count {
            let leftBound = CGFloat(i) * absoluteLength
            let rightBound = leftBound + absoluteLength
            ranges.append((leftBound...rightBound, reversedIndex ? count - (i + 1) : i))
        }
        return ranges
    }
    
    func setupVision() {
        
        let horizontalRange = closedRangeForElementsCount(9)
        let verticalRange = closedRangeForElementsCount(9, reversedIndex: true)
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.customWords = (1...9).map({ String($0) })
        textRecognitionRequest = VNRecognizeTextRequest { [weak self] (request, error)  in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            
            var data: [ValueData] = []
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                
                
                let candidateCenter = observation.boundingBox.absoluteCenter
                
                var text = topCandidate.string
                if topCandidate.string == "7" {
                    var oneCount = 0
                    for candindate in observation.topCandidates(9) {
                        if (candindate.string == "1")
                        {
                            oneCount += 1
                        }
                    }
                    
                    if oneCount > 5 {
                        text = "1"
                    }
                }
                
                if text.count > 1 {
                    let trimmedText = text.trimmingCharacters(in: .whitespaces)
                    let width = observation.boundingBox.width / CGFloat(trimmedText.count)
                    let centerY = observation.boundingBox.origin.y + observation.boundingBox.height / 2
                    let originX = observation.boundingBox.origin.y
                    
                    for (index, char) in trimmedText.enumerated() {
                        let centerX = originX + CGFloat(index) * (width/CGFloat(text.count))
                        let center = CGPoint(x: centerX, y: centerY)
                        
                        if let horizontalIndex = horizontalRange.first(where: { $0.0.contains(center.x) })?.1,
                           let verticalIndex = verticalRange.first(where: { $0.0.contains(center.y) })?.1 {
                            data.append(ValueData(value: String(char), column: horizontalIndex, row: verticalIndex))
                        }
                    }
                    
                } else {
                    if let horizontalIndex = horizontalRange.first(where: { $0.0.contains(candidateCenter.x) })?.1,
                       let verticalIndex = verticalRange.first(where: { $0.0.contains(candidateCenter.y) })?.1 {
                        data.append(ValueData(value: text, column: horizontalIndex, row: verticalIndex))
                    }
                }
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.processScannedData(data)
                //                    return self?.scannedData
            }
        }
        
    }
    
    private func processImage(_ image: UIImage) {
        recognizeTextInImage(image)
    }
    
    private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
            }
        }
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        let originalImage = scan.imageOfPage(at: 0)
        let newImage = compressedImage(originalImage)
        controller.dismiss(animated: true)
        
        processImage(newImage)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func compressedImage(_ originalImage: UIImage) -> UIImage {
        guard let imageData = originalImage.jpegData(compressionQuality: 1),
              let reloadedImage = UIImage(data: imageData) else {
            return originalImage
        }
        return reloadedImage
    }
}
