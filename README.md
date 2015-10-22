# Colosseo
#####Colosseo website and game backend

##API
Exchanging data between Colosseo game client and web database.

<https://colosseo.herokuapp.com/api/>

**Documentation:** <http://docs.colosseo.apiary.io/>

###~~Curl Documentation (outdated)~~

####login
```
curl -H "Content-type: application/json" -d ' {"credentials":{"username":"seacen","password":"seacen"}}' https://colosseo.herokuapp.com/api/login
```

####sign up
```
curl -H "Content-type: application/json" -d ' {"user":{"username":"seacen","password":"seacen"}}' https://colosseo.herokuapp.com/api/signup
```

####retrieve score
```
curl https://colosseo.herokuapp.com/api/users/3 -H 'Authorization: Token token="#{token}"'
```

####update score
```
curl -H "Content-type: application/json" -H 'Authorization: Token token="#{token}"' -d ' {"user":{"score":"25"}}' https://colosseo.herokuapp.com/api/users/3
```
