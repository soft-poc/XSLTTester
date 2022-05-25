import json
import requests

def readFile():
    SKUS = []
    with open("itemlist.txt") as itemlist:
        for items in itemlist.readlines():
            SKUS.append(items.replace('\n',''))
    return SKUS

def createSKU(token,payload):

    url = "https://sandbox-quickbooks.api.intuit.com/v3/company/4625319964620846718/item?minorversion=63"

    headers = {
        'Authorization': 'Bearer '+token,
        'Content-Type': 'application/json'
    }
    response = requests.request("POST", url, headers=headers, data=payload)
    print(response.text)


with open("config.json") as file:
    json_response=json.load(file)

    for sku in readFile():
        payload = '''{
          "TrackQtyOnHand": true, 
          "Name": "'''+sku+'''", 
          "QtyOnHand": 10, 
          "IncomeAccountRef": {
            "name": "Sales of Product Income", 
            "value": "79"
          }, 
          "AssetAccountRef": {
            "name": "Inventory Asset", 
            "value": "81"
          }, 
          "InvStartDate": "2015-01-01", 
          "Type": "Inventory", 
          "ExpenseAccountRef": {
            "name": "Cost of Goods Sold", 
            "value": "80"
          }
        }'''

        createSKU(json_response["access_token"],payload)

    access_token = json_response["access_token"]

