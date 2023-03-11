# -*- coding: utf-8 -*-
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
driver = webdriver.Chrome('./data/chormedriver.exe')

url = 'https://www.spoany.co.kr/cscenter/story_view.html'
driver.get(url)
html = driver.page_source

from bs4 import BeautifulSoup
soup = BeautifulSoup(html, 'html.parser')

data = []

wait = WebDriverWait(driver, 10)
element = wait.until(EC.element_to_be_clickable((By.XPATH, '//section[@class="page_wrap"]/div[3]/div[5]/a')))
element.click()

for k in range(1,7):
    #print("k="+str(k))
    for j in range(2,13):
        #print("j="+str(j))
        for i in range(1,11):
            wait = WebDriverWait(driver, 10)
            element = wait.until(EC.element_to_be_clickable((By.XPATH, '//*[contains(@class, "ul_news") and contains(@class, "ul_news_lg")]/li['+str(i)+']')))
            element.click()
            
            html = driver.page_source
            soup = BeautifulSoup(html, 'html.parser')
            boardcontents = soup.select("div.contain.mgb_50")
            #print(boardcontents)
            for boardcontent in boardcontents:
                title = boardcontent.select_one('div.view_title').text
                content = boardcontent.select_one('div.view_content').text
                #print(title, content, sep="|")
                data.append([title, content])
                #print(title)
                
            driver.implicitly_wait(5)
            driver.back()
            #wait = WebDriverWait(driver, 10)
            #element = wait.until(EC.element_to_be_clickable((By.XPATH, '//section[@class="page_wrap"]/div[3]/div[5]/a')))
            #element.click()

        if k==1 and j==12:
            break
        elif k == 6 and j==11:
            element = wait.until(EC.element_to_be_clickable((By.XPATH, '//ul[@class="pagination"]/li['+str(j-1)+']/a')))
            break
        else:
            element = wait.until(EC.element_to_be_clickable((By.XPATH, '//ul[@class="pagination"]/li['+str(j)+']/a')))
        element.click()
        
#print(data)

import pandas as pd
columns = ['제목','내용']
pd_data = pd.DataFrame(data, columns=columns)
print(pd_data.head())
pd_data.to_excel('./save/keyword.xlsx', index=False)