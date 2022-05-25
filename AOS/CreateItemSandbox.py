import requests
import json

url = "https://sandbox-quickbooks.api.intuit.com/v3/company/4620816365221840270/item?minorversion=63"


SKUS =['Lelexo MA32 Peel Pads',
'Ground 4-10 business days',
'Art of Skin Care Skin Perfection SPF 40',
'Face Reality Hydrabalance Hydrating Gel']

for x in SKUS:

  str_payload='''{
    "TrackQtyOnHand": true,
    "Name": "'''+x+'''",
    "QtyOnHand": 10,
    "IncomeAccountRef": {
      "value": "79",
      "name": "Sales of Product Income"
    },
    "AssetAccountRef": {
      "value": "81",
      "name": "Inventory Asset"
    },
    "InvStartDate": "2015-01-01",
    "Type": "Inventory",
    "ExpenseAccountRef": {
      "value": "80",
      "name": "Cost of Goods Sold"
    }
  }'''

  headers = {
    'Authorization': 'Bearer eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..PTMl3aWtvF_Y7C6fwP6kkQ.YfQy-dS-_DWkzP-9qxAwtTrhXK_OF6vtPdggDbGulE0B2n-Nt_4cYbnkuE9tAkzZWe0D5kzFsFr18Y9tz4eVYHx3ClRlnsNEWOqAsaXgOxzPboP-jnEI-vX2kgZQrDuFFV4spaeQbYnvxo_RB5Vx1VA3xqCwsFGh1k0QjwA0C2hUYzyIgPi1IIr2255ntxEklGM32jkB5viZsxhoFYs1pgjT6xGLiBechP8-k-W7hUzCmzzjO2UgRye_Vd77kdqlQiRZqH2qxXvTDdSkSIT6nPcKOfuBlE23oNb-eeH_lC7cMgq4fmwhBuVQCIIxyBzmaxQ9xZe_FYNLcA9P-16ku0_CpPfRjNquotfm9NTR94RR3PGhK2ZT71B6md-JqZgTYXKzwtiCB1GwrJoAbOkeOVspALN-D8xQnNphRRpiQ9GgV9Bfo7zE00YswnUs3aowZARLdbS2KJsN-5YALKkWRhmiS8qkiwOXduE82_ST8fMV-EJJz4xFq7EFfGl5WbI5lMC1ADtmGj2H4nMqduJ8KOm7LAX2FtistrMYnxB7TYfV37n3v0PchNAH99HIVwyKiMLuqVAe-fJeTD8_pxejp075a5veCQCXAgibss0XHtqQVuS8vLKCmuuKwzBd_bvyc62EpVewBuxm9no5dE2hrBOtEwYiBqm070NwMzdePxVB3ww_2_g3OKM6wwuXH0KnlAofPzRPPJGrAZzeZGGd9Me-n7-aImMEJ6IGu9MDvVsjFmldQX04hO99QbHVGjN2iSdZFRfvoHKjejLxLOeyh40ssyVxPc1tbClLUFsaQJqJy-x5xSBC0DafymjmEEzkSDAUFnyyntBn_9Aj5w7OeD1XNP9BBxJA1D9EuUtluJTEwqZ4M2p5juqNahREQEt95bDkDl0dePZVyrZwOQMJPQ.hA8eIQYhbVvvyYgbrblAhg',
    'Content-Type': 'application/json'
  }

  response = requests.request("POST", url, headers=headers, data=str_payload)

  print(response.text)
