## Testing scripts

```STAGING_HOST="34.71.220.143:8080"```

```curl $STAGING_HOST/buy -d '{ "userName": "a1", "stockSymbol": "BA", "unit_price": 75.2, "amount": 100}' -H "Content-Type:application/json"```
- output: 
        `{"Type":"buy", "Stock":"BA", "TotalCost":7614.000000, "Status":1}`
        <hr />
```curl $STAGING_HOST/sell -d '{ "userName": "a1", "stockSymbol": "AVTR", "unit_price": 20.4, "amount": 50}' -H "Content-Type:application/json"```
- output:
        `{"Type":"sell", "Stock":"AVTR", "TotalCost":1032.750000, "Status":1}`
        <hr />
```curl $STAGING_HOST/list``` 
- output:
        `[{"symbol":"AVTR", "name":"Avantor Inc", "price":30.05, "quantity":50000}, {"symbol":"BA", "name":"Boeing Co", "price":127.26, "quantity":150000}]`
        <hr />
```curl $STAGING_HOST/fee``` 
- output:
        `0.0125`
        <hr />
```curl $STAGING_HOST/status``` 
- output:
        `market is open`
        <hr />