//
//  TopNewsPreview.swift
//  News-SUI
//
//  Created by KsArT on 19.11.2024.
//

import Foundation

enum TopNewsPreview {
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
                publishedAt: "2024-11-18T14:44:02.000000Z".toDateFromIso8601(),
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
                publishedAt: "2024-11-18T14:43:07.000000Z".toDateFromIso8601(),
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
                publishedAt: "2024-11-18T14:39:11.000000Z".toDateFromIso8601(),
                source: "focus.ua",
                categories: [],
                locale: "ua"
            )
        )
        return list
    }()
}
