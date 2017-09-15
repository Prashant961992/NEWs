//
//  ViewController.swift
//  NewsApp
//
//  Created by Prashant Prajapati on 15/09/17.
//  Copyright © 2017 Prashant Prajapati. All rights reserved.
//

import UIKit


class ViewController: UIViewController ,XMLParserDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UtilityUIColor().BLUEColor()
        
        //        let parser = XMLParser(contentsOf:(NSURL(string:"http://www.bollywoodhungama.com/rss/news.xml"))! as URL)!
        //        parser.delegate = self
        //        parser.parse()
    
        //xml parser swift 3 with sub elements
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "e8419b0d-9a14-6aaa-ecfb-b3d266143b36"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://www.bollywoodhungama.com/rss/news.xml")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                
                var options = AEXMLOptions()
                options.parserSettings.shouldProcessNamespaces = false
                options.parserSettings.shouldReportNamespacePrefixes = false
                options.parserSettings.shouldResolveExternalEntities = false
                
                do {
                    let xmlDoc = try AEXMLDocument(xml: data!, options: options)
                    print(xmlDoc.xml)
                    
                    for child in xmlDoc.root.children {
                        print(child.name)
                        print(child.attributes)
                        //print(child.value!)
                    }
                   print(xmlDoc.root["channel"]["item"].children[2].string)
                    print(xmlDoc.root["channel"]["item"]["title"].count)
                    
                    if let cats = xmlDoc.root["channel"]["item"].all{
                        for cat in cats {
                            print(cat.all(withValue: "item") as Any)
                        }
                    }
        
                }
                catch {
                    print("\(error)")
                }
                
            }
        })
        
        dataTask.resume()

        
        
        
        
        
    }
 
    var elementValue: String?
    var success = false
    func parserDidStartDocument(_ parser: XMLParser){
        print("parserDidStartDocument");
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "success" {
            elementValue = String()
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if elementValue != nil {
            elementValue! += string
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "success" {
            if elementValue == "true" {
                success = true
            }
            elementValue = nil
        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parseErrorOccurred: \(parseError)")
    }

    
   

}

