# Colosseo
#####Colosseo website and game backend

##Introduction
Colosseo is a simple stage fight game, a player is able to choose one of three characters and use its unique skills to fight.

The codes contained in this repository are served as the game website and API for BaaS functionality. Only API is available at the moment.

##API
Exchanging data between Colosseo application and cloud storage.

<https://colosseo.herokuapp.com/api/>

**Documentation:** <http://docs.colosseo.apiary.io/>
<br>
<br>
<br>
####~~Curl Documentation (outdated)~~

#####login
```
curl -H "Content-type: application/json" -d ' {"credentials":{"username":"seacen","password":"seacen"}}' https://colosseo.herokuapp.com/api/login
```

#####sign up
```
curl -H "Content-type: application/json" -d ' {"user":{"username":"seacen","password":"seacen"}}' https://colosseo.herokuapp.com/api/signup
```

#####retrieve score
```
curl https://colosseo.herokuapp.com/api/users/3 -H 'Authorization: Token token="#{token}"'
```

#####update score
```
curl -H "Content-type: application/json" -H 'Authorization: Token token="#{token}"' -d ' {"user":{"score":"25"}}' https://colosseo.herokuapp.com/api/users/3
```
