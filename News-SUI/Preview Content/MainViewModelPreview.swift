//
//  MainViewModelPreview.swift
//  News-SUI
//
//  Created by KsArT on 16.11.2024.
//

import Foundation

final class MainViewModelPreview: Observable {
    static let shared = MainViewModel(repository: NewsRepositoryPreview())
}

private final class NewsRepositoryPreview: NewsRepository {
    func fetchTopNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        .success(TopNewsPreview.news)
    }
    
    func fetchAllNews(locale: String, language: String, page: Int) async -> Result<[NewsData], any Error> {
        .success(AllNewsPreview.news)
    }
    
    func fetchNews(id: String) async -> Result<NewsData, any Error> {
        if let news = TopNewsPreview.news.first(where: { $0.id == id }) ??
            AllNewsPreview.news.first(where: { $0.id == id }) {
            .success(news)
        } else {
            .failure(NetworkError.cancelled)
        }
    }
}

private enum TopNewsPreview {
    static var news: [NewsData] = {
        var list: [NewsData] = []
        list.append(
            NewsData(
                id: "c6285380-f083-4bf5-b163-5cd9feab98ab",
                title: "Принцесса Шарлотта имеет больше шансов стать королевой, чем принцесса Анна",
                description: "Принцесса Шарлотта может стать королевой, если принц Джордж отречется от престола или ?...",
                keywords: "Принцесса Шарлотта, принцесса Анна, принц джордж, король великой британии, королевская семья британии",
                snippet: "И принцесса Шарлотта, и принцесса Анна имеют похожие судьбы. У них есть старшие братья, ?...",
                url: "https://focus.ua/korolevskaia-semia/679218-princessa-sharlotta-mozhet-stat-korolevoy-pri-kakom-uslovii",
                imageUrl: "https://focus.ua/static/storage/thumbs/1200x630/9/4a/4c389849-02c3df9b86bdd71cd22e70531c8fc4a9.jpg?v=1047_1",
                image: nil,
                language: "ru",
                publishedAt: "2024-11-18T14:44:02.000000Z",
                source: "focus.ua",
                categories: [],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "1633fa45-ef7e-4a2d-b629-7fea22da46ba",
                title: "Андрей Хлывнюк отказался от международной премии Магнитского: какая причина",
                description: "Фронтмен группы «Бумбокс» Андрей Хлывнюк отказался от премии имени Магнитского из-за д...",
                keywords: "Хлывнюк отказался от премии, Андрей Хлывнюк, Юлия Навальная, премия Магнитского, права человека",
                snippet: "Андрей Хлывнюк отметил, что не может получить премию вместе с лауреатами, которые не ув...",
                url: "https://focus.ua/ukrayinskij-shoubiz/679184-hlyvnyuk-otkazalsya-ot-premii-po-pravam-cheloveka-detali",
                imageUrl: "https://focus.ua/static/storage/thumbs/1200x630/1/44/a24deb49-29fe361602fccdc1ee6212184435a441.jpg?v=1469_1",
                image: nil,
                language: "ru",
                publishedAt: "2024-11-18T14:43:07.000000Z",
                source: "focus.ua",
                categories: [],
                locale: "ua"
            )
        )
        list.append(
            NewsData(
                id: "bee95719-cffc-4e04-8486-529127ebdb6e",
                title: "Подчиненные рэкетиры похитили и пытали военного: депутат оказался главарем банды (фото)",
                description: "В СБУ сообщили, что разоблачили преступную группу, которая занималась рэкетом в Днепро?...",
                keywords: "Юрий Пришедько, Пришедько, задержали Пришедько, Пришедько рэкет, депутат Пришедько, Днепропетровская область, рэкет, рэкетиры, военный, ВСУ, новости Украины, криминальные новости, СБУ, Служба безопасности Украины",
                snippet: "В СБУ сообщили, что задокументировали, как рэкетиры похитили военного и избили его в ле?...",
                url: "https://focus.ua/politics/679215-reket-v-dnepropetrovskoy-oblasti-bandu-vozglavlyal-deputat",
                imageUrl: "https://focus.ua/static/storage/thumbs/1200x630/2/3d/769b4aa7-d0714f4792f1310d9eb7c1765b97a3d2.jpeg?v=1275_1",
                image: nil,
                language: "ru",
                publishedAt: "2024-11-18T14:39:11.000000Z",
                source: "focus.ua",
                categories: [],
                locale: "ua"
            )
        )
        return list
    }()
}

private enum AllNewsPreview {
    static var news: [NewsData] = {
        var list: [NewsData] = []
        list.append(
            NewsData(
                id: "f845e6a9-9fd4-4370-8e9c-3fa1d7751865",
                title: "Shanghai scraps residential housing distinction to accelerate home sales",
                description: "",
                keywords: "",
                snippet: "Shanghai on Monday further relaxed its real estate policies, eliminating distinction between ordinary and non-ordinary homes and expanding tax incentives for pr...",
                url: "http://www.ecns.cn/news/economy/2024-11-18/detail-ihekectp0358339.shtml",
                imageUrl: "https://image.chinanews.com/cspimp/2024/11-18/19a99394-b7f2-46e8-88e7-d72b6be22579_big.JPG",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:01:35.000000Z",
                source: "ecns.cn",
                categories: ["general"],
                locale: ""
            )
        )
        list.append(
            NewsData(
                id: "7122e6cc-9ed0-479b-bbac-b23d75a31139",
                title: "Listed firms' operating profits hit record high during Jan.-Sept. period.",
                description: "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the f...",
                keywords: "",
                snippet: "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the first nine months of 2024 on strong demand for semiconductors and a glo...",
                url: "https://en.yna.co.kr/view/AEN20241118007300320?section=news&input=rss",
                imageUrl: "https://img9.yna.co.kr/etc/inner/EN/2024/11/18/AEN20241118007300320_03_i_P4.jpg",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:00:11.000000Z",
                source: "yna.co.kr",
                categories: ["general"],
                locale: ""
            )
        )
        list.append(
            NewsData(
                id: "b098c0bc-8508-46c2-80f2-4f8264b40260",
                title: "Reserve Bank of India",
                description: "",
                keywords: "",
                snippet: "A. Source Security 7.27% GS 2026 6.99% GS 2026 6.99% GS 2026 8.33% GS 2026 5.74% GS 2026 B. Notified Amount (amount in ₹ cr) 1,000 3,000 1,000 1,000 2,000 Des...",
                url: "https://www.rbi.org.in/scripts/BS_PressReleaseDisplay.aspx?prid=59122",
                imageUrl: "https://www.rbi.org.in/images/Rbinote.jpeg",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:00:00.000000Z",
                source: "rbi.org.in",
                categories: ["business","general"],
                locale: ""
            )
        )
        return list
    }()
}
/*
 0
 uuid    "c6285380-f083-4bf5-b163-5cd9feab98ab"
 title    "Принцесса Шарлотта имеет больше шансов стать королевой, чем принцесса Анна"
 description    "Принцесса Шарлотта может стать королевой, если принц Джордж отречется от престола или ?..."
 keywords    "Принцесса Шарлотта, принцесса Анна, принц джордж, король великой британии, королевская семья британии"
 snippet    "И принцесса Шарлотта, и принцесса Анна имеют похожие судьбы. У них есть старшие братья, ?..."
 url    "https://focus.ua/korolevskaia-semia/679218-princessa-sharlotta-mozhet-stat-korolevoy-pri-kakom-uslovii"
 image_url    "https://focus.ua/static/storage/thumbs/1200x630/9/4a/4c389849-02c3df9b86bdd71cd22e70531c8fc4a9.jpg?v=1047_1"
 language    "ru"
 published_at    "2024-11-18T14:44:02.000000Z"
 source    "focus.ua"
 categories    []
 relevance_score    null
 locale    "ua"
 1
 uuid    "1633fa45-ef7e-4a2d-b629-7fea22da46ba"
 title    "Андрей Хлывнюк отказался от международной премии Магнитского: какая причина"
 description    "Фронтмен группы «Бумбокс» Андрей Хлывнюк отказался от премии имени Магнитского из-за д..."
 keywords    "Хлывнюк отказался от премии, Андрей Хлывнюк, Юлия Навальная, премия Магнитского, права человека"
 snippet    'Андрей Хлывнюк отметил, что не может получить премию вместе с лауреатами, которые "не ув...'
 url    "https://focus.ua/ukrayinskij-shoubiz/679184-hlyvnyuk-otkazalsya-ot-premii-po-pravam-cheloveka-detali"
 image_url    "https://focus.ua/static/storage/thumbs/1200x630/1/44/a24deb49-29fe361602fccdc1ee6212184435a441.jpg?v=1469_1"
 language    "ru"
 published_at    "2024-11-18T14:43:07.000000Z"
 source    "focus.ua"
 categories    []
 relevance_score    null
 locale    "ua"
 2
 uuid    "bee95719-cffc-4e04-8486-529127ebdb6e"
 title    "Подчиненные рэкетиры похитили и пытали военного: депутат оказался главарем банды (фото)"
 description    "В СБУ сообщили, что разоблачили преступную группу, которая занималась рэкетом в Днепро?..."
 keywords    "Юрий Пришедько, Пришедько, задержали Пришедько, Пришедько рэкет, депутат Пришедько, Днепропетровская область, рэкет, рэкетиры, военный, ВСУ, новости Украины, криминальные новости, СБУ, Служба безопасности Украины"
 snippet    "В СБУ сообщили, что задокументировали, как рэкетиры похитили военного и избили его в ле?..."
 url    "https://focus.ua/politics/679215-reket-v-dnepropetrovskoy-oblasti-bandu-vozglavlyal-deputat"
 image_url    "https://focus.ua/static/storage/thumbs/1200x630/2/3d/769b4aa7-d0714f4792f1310d9eb7c1765b97a3d2.jpeg?v=1275_1"
 language    "ru"
 published_at    "2024-11-18T14:39:11.000000Z"
 source    "focus.ua"
 categories    []
 relevance_score    null
 locale    "ua"
 */

/*
 // all
 uuid    "f845e6a9-9fd4-4370-8e9c-3fa1d7751865"
 title    "Shanghai scraps residential housing distinction to accelerate home sales"
 description    ""
 keywords    ""
 snippet    "Shanghai on Monday further relaxed its real estate policies, eliminating distinction between ordinary and non-ordinary homes and expanding tax incentives for pr..."
 url    "http://www.ecns.cn/news/economy/2024-11-18/detail-ihekectp0358339.shtml"
 image_url    "https://image.chinanews.com/cspimp/2024/11-18/19a99394-b7f2-46e8-88e7-d72b6be22579_big.JPG"
 language    "en"
 published_at    "2024-11-18T16:01:35.000000Z"
 source    "ecns.cn"
 categories
 0    "general"
 relevance_score    null
 1
 uuid    "7122e6cc-9ed0-479b-bbac-b23d75a31139"
 title    "Listed firms' operating profits hit record high during Jan.-Sept. period."
 description    "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the f..."
 keywords    ""
 snippet    "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the first nine months of 2024 on strong demand for semiconductors and a glo..."
 url    "https://en.yna.co.kr/view/AEN20241118007300320?section=news&input=rss"
 image_url    "https://img9.yna.co.kr/etc/inner/EN/2024/11/18/AEN20241118007300320_03_i_P4.jpg"
 language    "en"
 published_at    "2024-11-18T16:00:11.000000Z"
 source    "yna.co.kr"
 categories
 0    "general"
 relevance_score    null
 2
 uuid    "b098c0bc-8508-46c2-80f2-4f8264b40260"
 title    "Reserve Bank of India"
 description    ""
 keywords    ""
 snippet    "A. Source Security 7.27% GS 2026 6.99% GS 2026 6.99% GS 2026 8.33% GS 2026 5.74% GS 2026 B. Notified Amount (amount in ₹ cr) 1,000 3,000 1,000 1,000 2,000 Des..."
 url    "https://www.rbi.org.in/scripts/BS_PressReleaseDisplay.aspx?prid=59122"
 image_url    "https://www.rbi.org.in/images/Rbinote.jpeg"
 language    "en"
 published_at    "2024-11-18T16:00:00.000000Z"
 source    "rbi.org.in"
 categories
 0    "business"
 1    "general"
 relevance_score    null
 */
