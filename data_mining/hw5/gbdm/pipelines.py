# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from scrapy import Request
from scrapy.pipelines.images import ImagesPipeline
import pymongo


class ScrapyPipeline:
    def __init__(self):
        client = pymongo.MongoClient('mongodb://localhost:27017')
        self.db = client['youla']

    def process_item(self, item, spider):
        collection = self.db[type(item).__name__]
        collection.insert(item)
        return item


class ScrapyImagePipeline(ImagesPipeline):
    def get_media_requests(self, item, info):
        for url in item.get('images', []):
            try:
                yield Request(url)
            except Exception as e:
                print(e)

    def item_completed(self, results, item, info):
        item['images'] = [itm[1] for itm in results if itm[0]]
        return item
