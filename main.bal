import ballerina/time;
import ballerina/http;

type Trade record {|
    string userName;
    string stockSymbol;
    decimal unit_price;
    int amount;
    time:Utc timeStamp = time:utcNow();
|};

type Buy record {|
    *Trade;
    boolean isBuy = true;
|};

type Sell record {|
    *Trade;
    boolean isBuy = false;
|};

type Stock record {
    string symbol;
    string name;
    decimal price;
    int quantity;
};

# Service listen on 9090
service / on new http:Listener(9090) {

    @http:ResourceConfig {
        consumes: ["application/json"]
    }
    resource function post buy (@http:Payload Buy buyData) returns json {
        decimal total_cost = <decimal> buyData.amount * buyData.unit_price * 1.0125;
        json res = {Type: "buy", Stock: buyData.stockSymbol, TotalCost: total_cost, Status: 1};
        return res;
    }

    @http:ResourceConfig {
        consumes: ["application/json"]
    }
    resource function post sell (@http:Payload Buy sellData) returns json {
        decimal total_cost = <decimal> sellData.amount * sellData.unit_price * 1.0125;
        json res = {Type: "sell", Stock: sellData.stockSymbol, TotalCost: total_cost, Status: 1};
        return res;
    }

    resource function get list () returns json {
        Stock[] stocks = [
            {symbol: "AVTR",
            quantity: 50000,
            price: 30.05,
            name: "Avantor Inc"},
            {symbol: "BA",
            quantity: 150000,
            price: 127.26,
            name: "Boeing Co"}
        ];

        return stocks.toJson();
    }

    resource function get fee () returns decimal {
        return 0.0125;
    }

    resource function get status () returns string {
        return "market is open";
    }
}

