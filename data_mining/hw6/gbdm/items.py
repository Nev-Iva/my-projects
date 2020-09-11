# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class InstaPostItem(scrapy.Item):
    _id = scrapy.Field()
    data = scrapy.Field()


class InstaHashTagItem(scrapy.Item):
    _id = scrapy.Field()
    data = scrapy.Field()


class InstaUserItem(scrapy.Item):
    _id = scrapy.Field()
    data = scrapy.Field()