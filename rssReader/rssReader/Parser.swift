//
//  Parser.swift
//  rssReader
//
//  Created by Admin on 21.12.15.
//  Copyright © 2015 iStudent. All rights reserved.
//

import Foundation

class Parser : NSObject, NSXMLParserDelegate{
    
    var xmlParser: NSXMLParser!
    var news = [News]()
    
    var entryTitle: String?
    var entryDescription: String?
    var entryPubDate: String?
    var entryLink: String?
    var entryImageLink: String?
    
    
    var currentParsedElement = String()
    var weAreInsideAnItem = false

    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == "item"{
            weAreInsideAnItem = true
        }
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                entryTitle = String()
                currentParsedElement = "title"
            case "description":
                entryDescription = String()
                currentParsedElement = "description"
            case "pubDate":
                entryPubDate = String()
                currentParsedElement = "pubDate"
            case "link":
                entryLink = String()
                currentParsedElement = "link"
            case "enclosure":
                entryImageLink = attributeDict["url"] as String!
                currentParsedElement = "enclosure"
            default: break
            }
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        if weAreInsideAnItem{
            switch currentParsedElement{
            case "title":
                if let titleOfNews = entryTitle{
                    entryTitle = titleOfNews + string
                }
            case "description":
                if let descriptionOfNews = entryDescription{
                    entryDescription = descriptionOfNews + string}
            case "pubDate":
                if let pubDateOfNews = entryPubDate{
                    entryPubDate = pubDateOfNews + string}
            case "link":
                if let linkOfNews = entryLink{
                    entryLink = linkOfNews + string}
            default: break
                
            }
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if weAreInsideAnItem{
            switch elementName{
            case "title":
                currentParsedElement = ""
            case "description":
                currentParsedElement = ""
            case "pubDate":
                currentParsedElement = ""
            case "link":
                currentParsedElement = ""
            default: break
            }
            if elementName == "item"{
                let entryNews = News()
                
                if let tempTitle = entryTitle {
                    entryNews.newsTitle = tempTitle}
                if let tempDescription = entryDescription{
                    let str = tempDescription.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
                    entryNews.newsDescription = str}
                if let tempPubDate = entryPubDate {
                    entryNews.newsPubDate = tempPubDate}
                if let tempLink = entryLink{
                    entryNews.newsLink = tempLink}
                if let tempImageLink = entryImageLink{
                    entryNews.newsImageLink = tempImageLink}
                news.append(entryNews)
                weAreInsideAnItem = false
            }
        }
    }
    func refreshNews(UrlString : NSURL){
        news = [News]();
        self.xmlParser = NSXMLParser(contentsOfURL: UrlString)
        self.xmlParser.delegate = self
        self.xmlParser.parse()}
    

    
        
            
        
    

}
























