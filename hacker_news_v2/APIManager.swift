//
//  APIManager.swift
//  hacker_news_v2
//
//  Created by Mariano Martinez on 2/4/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import Foundation
import Alamofire

class APIManager{
    static let shared_APIManager = APIManager() //Singleton. Use one in all the project.
    var hacker_url = "https://hn.algolia.com/api/v1/search_by_date?query=ios"
    
    private init(){ //Only accesable from here.
    }
    
    func getHackerNews(completionSuccess: @escaping ([HackerNews])->Void, completionFail:@escaping(String)->Void) {
        Alamofire.request(hacker_url, method:.get,encoding:JSONEncoding.default).responseData{(response) in
            switch response.result{
            case .success(var data):
                data = response.data!
                let decoder = JSONDecoder()
                do{
                    let hackerNews = try decoder.decode(HackerNewsHits.self, from: data)
                    completionSuccess(hackerNews.hits)
                    print(hackerNews.hits.count)
                }catch(let error){
                    completionFail(error.localizedDescription)
                }
            case .failure(let failMessage):
                completionFail(failMessage.localizedDescription)
            }
        }
        
    }
}
