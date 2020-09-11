import scrapy
from hw5.gbdm.loaders import YoulaLoader


class YoulaSpider(scrapy.Spider):
    name = 'youla'
    allowed_domains = ['auto.youla.ru']
    start_urls = ['https://auto.youla.ru/moskva/cars/used/moskvich/']

    __xpath_query = {
        'pagination': '//div[contains(@class, "Paginator_block__2XAPy")]//div[@class="Paginator_total__oFW1n"]/text()',
        'ads': '//div[@class="SerpSnippet_titleWrapper__38bZM"]//a[@data-target="serp-snippet-title"]/@href',
        'title': '//div[@class="AdvertCard_advertTitle__1S1Ak"]/text()',
        'images': '//div[contains(@class, "AdvertCard_pageContent")]'
                  '//div[contains(@class, "PhotoGallery_photoWrapper")]//picture/source/@srcset',
        'params': '//div[@class="AdvertCard_specs__2FEHc"]/div',
        'descriptions': '//div[@class="AdvertCard_descriptionInner__KnuRi"]/text()',

        'price': '//div[@class="AdvertCard_priceBlock__1hOQW"]/div[@data-target="advert-price"]/text()',
        'author_url': '/html/body/script[contains(text(), "window.transitState = decodeURIComponent")]/text()'
    }

    def parse(self, response, start=True):
        if start:
            pages_count = int(response.xpath(self.__xpath_query['pagination']).extract()[1])
            for num in range(2, pages_count + 1):
                yield response.follow(
                    '{0}?page={1}#serp'.format(self.start_urls[0], num),
                    callback=self.parse,
                    cb_kwargs={'start': False}
                )

        for link in response.xpath(self.__xpath_query['ads']):
            yield response.follow(
                link,
                callback=self.ads_parse
            )

    def ads_parse(self, response):
        loader = YoulaLoader(response=response)
        loader.add_value('url', response.url)
        loader.add_xpath('title', self.__xpath_query['title'])
        loader.add_xpath('images', self.__xpath_query['images'])
        loader.add_xpath('params', self.__xpath_query['params'])
        loader.add_xpath('descriptions', self.__xpath_query['descriptions'])
        loader.add_xpath('price', self.__xpath_query['price'])
        loader.add_xpath('author_url', self.__xpath_query['author_url'])
        yield loader.load_item()
