import scrapy


class AvitoSpider(scrapy.Spider):
    name = 'avito'
    allowed_domains = ['www.avito.ru']
    start_urls = ['https://www.avito.ru/monino/kvartiry/prodam']

    __xpath_query = {
        'pagination': '//div[@class="index-content-2lnSO"]//'
                      'div[contains(@data-marker, "pagination-button")]/'
                      'span[@class="pagination-item-1WyVp"]/@data-marker',
        'ads': "//h3[@class='snippet-title']/a[@class='snippet-link'][@itemprop='url']/@href",
        'ad_title': '//div[@class="title-info-main"]/h1[@class="title-info-title"]/'
                    'span[@class="title-info-title-text"]/text()',
        'ad_photo': '//div[@class="gallery-imgs-container js-gallery-imgs-container"]'
                      '/div[@class="gallery-img-wrapper js-gallery-img-wrapper"]/div[1]/@data-url',
        'ad_prices': '//div[@class="price-value-prices-wrapper"]'
                     '/ul[@class="price-value-prices-list js-price-value-prices-list"]/li',
        'ad_address': '//div[@class="item-address"]/div[@itemprop="address"]/span/text()',
        'ad_params': '//ul[@class="item-params-list"]/li[@class="item-params-list-item"]'

    }

    def parse(self, response, start=True):
        if start:
            pages_count = int(
                response.xpath(self.__xpath_query['pagination']).extract()[-1].split('(')[-1].replace(')', ''))

            for num in range(2, pages_count + 1):
                yield response.follow(
                    f'?p={num}',
                    callback=self.parse,
                    cb_kwargs={'start': False}
                )

        for link in response.xpath(self.__xpath_query['ads']):
            yield response.follow(
                link,
                callback=self.ads_parse
            )

    def ads_parse(self, response):
        ad = {}
        ad['title'] = response.xpath(self.__xpath_query['ad_title']).get()

        ad['url'] = response.url

        photos = response.xpath(self.__xpath_query['ad_photo'])
        photos = photos.getall()
        ad['photo'] = []
        for url in photos:
            if url[:2] == '//':
                ad['photo'].append('https:' + url)
            else:
                ad['photo'].append(url)

        price_wrapper = response.xpath(self.__xpath_query['ad_prices'])
        prices = price_wrapper.xpath('text()')
        prices = prices.getall()
        prices = [elem for elem in prices if elem != '\n ']
        types_of_exchange = price_wrapper.xpath('span/text()|span/span/text()').extract()
        ad['price'] = []
        length_exchange = len(set(types_of_exchange))
        for i in range(length_exchange):
            ad['price'].append({'type of exchange ' + types_of_exchange[i]: (prices[i], prices[i + length_exchange])})

        ad['address'] = response.xpath(self.__xpath_query['ad_address']).get()

        ad_params = response.xpath(self.__xpath_query['ad_params'])
        keys = ad_params.xpath('span[@class="item-params-label"]/text()').extract()
        values = ad_params.xpath('text()|a/text()').extract()
        values = [value.strip() for value in values if value.strip() != '']
        ad['params'] = []
        for i in range(len(keys)):
            ad['params'].append({keys[i][:-2]: values[i]})

        yield ad
