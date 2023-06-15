# Session Handling Example App

Sample project is about session management using an API.

## Getting Started


I am using Dio package for network request & session management.
used Provider package for state management

## Configurations

First of all configure your mockoon server with below json file.
after that add that local server host to ```lib/client/api_client.dart```



export below json data to the mockoon to get the envoirnment & routes

```json

{
    "uuid": "5fe673d6-f0bd-4345-9d9f-40dbc12302e5",
    "lastMigration": 25,
    "name": "session handler mockoon",
    "endpointPrefix": "",
    "latency": 0,
    "port": 3001,
    "hostname": "0.0.0.0",
    "folders": [],
    "routes": [
        {
            "uuid": "cd87d48f-ac38-4857-86ec-b54a46bbd9d9",
            "documentation": "",
            "method": "get",
            "endpoint": "login",
            "responses": [
                {
                    "uuid": "7135f39d-9611-468d-a65e-cf9cb595e539",
                    "body": "{\n  \"status\" : 200,\n   \"message\" : \"you have successfully login\"\n}",
                    "latency": 0,
                    "statusCode": 200,
                    "label": "",
                    "headers": [
                        {
                            "key": "",
                            "value": ""
                        },
                        {
                            "key": "",
                            "value": ""
                        }
                    ],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": true
                }
            ],
            "enabled": true,
            "responseMode": null
        },
        {
            "uuid": "cdf3a0ce-a5e4-4b9f-99c2-2052d2d2c9ef",
            "documentation": "",
            "method": "post",
            "endpoint": "dashboard",
            "responses": [
                {
                    "uuid": "3e788112-3951-490d-b48c-9911875f7266",
                    "body": "{\n  \"ddd\":\"ddd\"\n}",
                    "latency": 0,
                    "statusCode": 200,
                    "label": "",
                    "headers": [],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": true
                },
                {
                    "uuid": "71220e81-3ebf-4467-ab4e-a5c364b7461d",
                    "body": "{\n  \"ddd\":\"ddd\"\n}",
                    "latency": 0,
                    "statusCode": 401,
                    "label": "",
                    "headers": [],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [
                        {
                            "target": "header",
                            "modifier": "Authorization",
                            "value": "1234",
                            "invert": true,
                            "operator": "equals"
                        }
                    ],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": false
                },
                {
                    "uuid": "aaedb7a0-91f9-4663-a68f-15605b8e74f6",
                    "body": "{\n  \"ddd\":\"ddd\"\n}",
                    "latency": 0,
                    "statusCode": 401,
                    "label": " (copy)",
                    "headers": [],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [
                        {
                            "target": "header",
                            "modifier": "Authorization",
                            "value": "1234",
                            "invert": true,
                            "operator": "equals"
                        }
                    ],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": false
                }
            ],
            "enabled": true,
            "responseMode": null
        },
        {
            "uuid": "060a1d7b-de69-41d0-a514-365a13a18129",
            "documentation": "",
            "method": "post",
            "endpoint": "refresh_token",
            "responses": [
                {
                    "uuid": "5ca6711c-5582-4ce0-bc13-b904338cc0e4",
                    "body": "{\n  \"access_token\":\"1234\",\n  \"refresh_token\":\"6789\"\n}",
                    "latency": 0,
                    "statusCode": 200,
                    "label": "",
                    "headers": [],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": true
                },
                {
                    "uuid": "3e3f69dd-00a1-46d2-9bfd-a0e6fef8103e",
                    "body": "{}",
                    "latency": 0,
                    "statusCode": 401,
                    "label": "",
                    "headers": [
                        {
                            "key": "Authorization",
                            "value": ""
                        }
                    ],
                    "bodyType": "INLINE",
                    "filePath": "",
                    "databucketID": "",
                    "sendFileAsBody": false,
                    "rules": [],
                    "rulesOperator": "OR",
                    "disableTemplating": false,
                    "fallbackTo404": false,
                    "default": false
                }
            ],
            "enabled": true,
            "responseMode": null
        }
    ],
    "rootChildren": [
        {
            "type": "route",
            "uuid": "cd87d48f-ac38-4857-86ec-b54a46bbd9d9"
        },
        {
            "type": "route",
            "uuid": "060a1d7b-de69-41d0-a514-365a13a18129"
        },
        {
            "type": "route",
            "uuid": "cdf3a0ce-a5e4-4b9f-99c2-2052d2d2c9ef"
        }
    ],
    "proxyMode": false,
    "proxyHost": "",
    "proxyRemovePrefix": false,
    "tlsOptions": {
        "enabled": false,
        "type": "CERT",
        "pfxPath": "",
        "certPath": "",
        "keyPath": "",
        "caPath": "",
        "passphrase": ""
    },
    "cors": true,
    "headers": [
        {
            "key": "Content-Type",
            "value": "application/json"
        }
    ],
    "proxyReqHeaders": [
        {
            "key": "",
            "value": ""
        }
    ],
    "proxyResHeaders": [
        {
            "key": "",
            "value": ""
        }
    ],
    "data": []
}

```



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
