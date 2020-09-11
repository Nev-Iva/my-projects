import requests
from bs4 import BeautifulSoup
import time
from hw3_database import HabrDB
from hw3_models import Writer, Tag, Post, Hab


class HabrParser:
    domain = 'https://habr.com'
    start_url = 'https://habr.com/ru/top/'

    def __init__(self, db):
        self.db = db
        self.visited_urls = set()
        self.post_links = set()

    def parse_rows(self, url=start_url):
        while url:
            time.sleep(0.5)
            if url in self.visited_urls:
                break
            response = requests.get(url)
            self.visited_urls.add(url)
            soap = BeautifulSoup(response.text, 'lxml')
            url = self.get_next_page(soap)
            self.search_post_links(soap)
            if len(self.visited_urls) > 30:
                break
            self.get_post_data(soap, url)

    def get_next_page(self, soap: BeautifulSoup) -> str:
        a = soap.find('a', attrs={'id': 'next_page'})
        return f'{self.domain}{a.get("href")}' if a and a.get("href") else None

    def search_post_links(self, soap: BeautifulSoup):
        posts_list = soap.find('div', attrs={'class': 'posts_list'})
        posts_a = posts_list.find_all('a', attrs={'class': 'post__title_link'})
        links = {f'{itm.get("href")}' for itm in posts_a}
        self.post_links.update(links)
        return links

    def parse(self):
        for url in self.post_links:
            time.sleep(0.5)
            if url in self.visited_urls:
                continue
            response = requests.get(url)
            self.visited_urls.add(url)
            soap = BeautifulSoup(response.text, 'lxml')
            self.get_post_data(soap, url)

    def get_post_data(self, soap: BeautifulSoup, url: str):
        result = {}
        result['url'] = url
        result['title'] = soap.find('span', attrs={'class': "post__title-text"}).text
        result['writer'] = self.get_writer_data(soap)
        result['tags'] = self.get_tags_data(soap)
        result['habs'] = self.get_habs_data(soap)
        self.db.add_post(Post(**result))

    def get_writer_data(self, soap: BeautifulSoup):
        writer = {}
        writer_info = soap.find('div', attrs={'class': 'author-panel__user-info'})
        writer_info = writer_info.find('div', attrs={'class': 'user-info'})
        writer['name'] = writer_info.get('data-user-login')
        writer['username'] = writer_info.get('data-user-login')
        writer['url'] = writer_info.find('a').get('href')
        result = Writer(**writer)
        return result

    def get_tags_data(self, soap: BeautifulSoup):
        tag_list = soap.find('dl', attrs={'class': 'post__tags'})
        tag_list = tag_list.find('ul', attrs={'class': 'js-post-tags'})
        tag_list = tag_list.find_all('a', attrs={'class': 'post__tag'})
        return [Tag(name=itm.text, url=itm.get('href')) for itm in tag_list]

    def get_habs_data(self, soap: BeautifulSoup):
        hab_ls = soap.find('ul', attrs={'class': 'js-post-hubs'})
        hab_ls = hab_ls.find_all('a', attrs={'class': 'post__tag'})
        hab_obj_list = [Hab(name=itm.text, url=itm.get('href')) for itm in hab_ls]
        return hab_obj_list


if __name__ == '__main__':
    database = HabrDB('sqlite:///habr_blog.db')
    parser = HabrParser(database)
    parser.parse_rows()
    parser.parse()
    print(1)