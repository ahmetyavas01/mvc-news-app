
import Foundation

class WebServices 
{
    static let shared = WebServices()
    
    private init() {}
    
    func fetchData(completion : @escaping ([Model]?) -> Void)
    {
        
        let apiKey = "https://newsapi.org/v2/top-headlines?country=us&apiKey=851f2c634c2b4723a8bf884af1433483"
        if let dataURL = URL(string: apiKey )
        {
            URLSession.shared.dataTask(with: dataURL) { data, response, error in
                if error != nil
                {
                    print(error?.localizedDescription)
                }
                else
                {
                    do
                    {
                        let result = try JSONDecoder().decode(NewsResponse.self, from: data!)
                        completion(result.articles)
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
            
        }
    }
    
    
}
